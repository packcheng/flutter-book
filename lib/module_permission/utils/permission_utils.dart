import 'package:notification_permissions/notification_permissions.dart';

///
/// 权限请求工具类
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/8 4:08 PM
///
class PermissionUtils {
  /// 请求通知权限
  static Future<PermissionStatus> requestNotificationPermissions() {
    return NotificationPermissions.requestNotificationPermissions(
        iosSettings: const NotificationSettingsIos(
            sound: true, badge: true, alert: true));
  }
}
