import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_book/utils/app_log.dart';
import 'package:meta/meta.dart';
import 'package:notification_permissions/notification_permissions.dart';

part 'notification_permission_state.dart';

///
/// App通知权限管理
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/8 11:43 AM
///
class NotificationPermissionCubit extends Cubit<NotificationPermissionState> {
  StreamSubscription<PermissionStatus> _notificationHelper;

  NotificationPermissionCubit() : super(NotificationPermissionUnknown());

  /// Checks the notification permission status
  void checkNotificationPermStatus() {
    if (null != _notificationHelper) {
      _notificationHelper.cancel();
    }

    AppLog.d('检查APP通知权限');

    _notificationHelper =
        NotificationPermissions.getNotificationPermissionStatus()
            .asStream()
            .listen((PermissionStatus status) {
      switch (status) {
        case PermissionStatus.denied:
          emit(NotificationPermissionDenied());
          break;
        case PermissionStatus.granted:
          emit(NotificationPermissionGranted());
          break;
        case PermissionStatus.provisional:
          emit(NotificationPermissionProvisional());
          break;
        case PermissionStatus.unknown:
        default:
          emit(NotificationPermissionUnknown());
          break;
      }
    });
  }

  @override
  Future<void> close() {
    if (null != _notificationHelper) {
      _notificationHelper.cancel();
    }
    return super.close();
  }
}
