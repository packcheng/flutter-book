import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/constants/res/app_configs.dart';
import 'package:flutter_book/flutter_book_app.dart';
import 'package:flutter_book/module_main/main_routers.dart';
import 'package:flutter_book/module_splash/splash_routers.dart';
import 'package:flutter_book/routers/routers_manager.dart';
import 'package:flutter_book/utils/app_log.dart';

import 'constants/application.dart';

void main() {
  // 初始化日志打印工具类
  AppLog.init(isDebug: AppConfigs.isDebug);

  // 初始化路由
  FluroRouter router = FluroRouter();
  RoutersManager.addModuleRouters(MainRouters());
  RoutersManager.addModuleRouters(SplashRouters());
  RoutersManager.configureRoutes(router);
  Application.setAppRouter = router;

  runApp(FlutterBookApp());
}
