import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

///
/// 全局数据管理
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/4 5:38 PM
///
class Application {
  //全局路由管理对象
  static FluroRouter _router;

  static final GlobalKey<NavigatorState> _navigatorKey =
      new GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get getNavigatorKey {
    return _navigatorKey;
  }

  /// 获取全局context
  static BuildContext get getContext {
    return _navigatorKey.currentState.overlay.context;
  }

  /// 获取全局路由管理对象
  static FluroRouter get getAppRouter {
    return _router;
  }

  /// 设置保存全局路由管理对象
  static set setAppRouter(FluroRouter fluroRouter) {
    _router = fluroRouter;
  }
}
