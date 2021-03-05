import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/constants/application.dart';
import 'package:flutter_book/constants/res/app_configs.dart';
import 'package:flutter_book/routers/routers_name.dart';

///
/// 页面跳转工具类
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/5 11:21 AM
///
class NavigationUtil {
  /// 返回
  static void goBack() {
    /// 其实这边调用的是 Navigator.pop(context);
    BuildContext context = Application.getContext;
    Application.getAppRouter.pop(context);
  }

  /// 带参数的返回
  static void goBackWithParams(result) {
    BuildContext context = Application.getContext;
    Application.getAppRouter.pop(context, result);
  }

  /// 跳转指定页面
  static void start(String path,
      {bool replace: false,
      TransitionType transition: AppConfigs.transitionTypeCommon,
      int durationMills: AppConfigs.transitionDurationNormal}) {
    startForResult(path,
        replace: replace, transition: transition, durationMills: durationMills);
  }

  /// 跳转指定页面并接受返回值
  /// [path] 需要跳转的路由名称
  /// [replace] 是否需要移除当前的页面
  /// [transition] 路由跳转类型
  /// [durationMills] 路由跳转时长，单位：毫秒
  static Future startForResult(String path,
      {bool replace: false,
      TransitionType transition: AppConfigs.transitionTypeCommon,
      int durationMills: AppConfigs.transitionDurationNormal}) {
    BuildContext context = Application.getContext;
    return Application.getAppRouter.navigateTo(context, path,
        replace: replace,
        transition: transition,
        transitionDuration: Duration(milliseconds: durationMills));
  }

  /// 跳转指定页面-使用自定义转场动画
  static void startWithTransition(String path,
      {bool replace: false,
      RouteTransitionsBuilder transitionBuilder,
      int durationMills: AppConfigs.transitionDurationNormal}) {
    startForResultWithTransition(path,
        replace: replace,
        transitionBuilder: transitionBuilder,
        durationMills: durationMills);
  }

  /// 跳转指定页面并接受返回值-使用自定义转场动画
  /// [path] 需要跳转的路由名称
  /// [replace] 是否需要移除当前的页面
  /// [transitionBuilder] 自定义转场动画
  /// [durationMills] 路由跳转时长，单位：毫秒
  static Future startForResultWithTransition(String path,
      {bool replace: false,
      RouteTransitionsBuilder transitionBuilder,
      int durationMills: AppConfigs.transitionDurationNormal}) {
    if (null == transitionBuilder) {
      // 创建默认的自定义转场动画
      transitionBuilder = (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return new ScaleTransition(
          scale: animation,
          child: new RotationTransition(
            turns: animation,
            child: child,
          ),
        );
      };
    }
    BuildContext context = Application.getContext;

    return Application.getAppRouter.navigateTo(context, path,
        replace: replace,
        transition: TransitionType.custom,
        transitionBuilder: transitionBuilder,
        transitionDuration: Duration(milliseconds: durationMills));
  }

  /// 跳转到主页面
  static void goHomePage() {
    start(RoutersName.pageMain);
  }
}
