import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/utils/app_log.dart';
import 'package:meta/meta.dart';

part 'app_state_state.dart';

///
/// App前后台切换状态管理
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/8 11:43 AM
///
class AppStateCubit extends Cubit<AppState> with WidgetsBindingObserver {
  AppStateCubit() : super(AppStateResumed());

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        AppLog.i('Observer--可见没有响应inactive');
        emit(AppStateInactive());
        break;
      case AppLifecycleState.paused:
        AppLog.i('Observer--不可见不响应paused');
        emit(AppStatePaused());
        break;
      case AppLifecycleState.resumed:
        AppLog.i('Observer--可见可交互resumed');
        emit(AppStateResumed());
        break;
      case AppLifecycleState.detached:
      default:
        AppLog.i('Observer--detached');
        emit(AppStateDetached());
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Future<void> close() {
    AppLog.i('CLOSE APP STATE CUBIT.');
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }
}
