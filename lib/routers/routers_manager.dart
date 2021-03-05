import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/routers/module_routers.dart';
import 'package:flutter_book/utils/app_log.dart';

///
/// 路由管理类
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/5 11:14 AM
///
class RoutersManager {
  static List<ModuleRoutersBase> _moduleRouters = [];

  /// 添加需要配置路由的模块
  static void addModuleRouters(ModuleRoutersBase moduleRouter) {
    AppLog.i('addModuleRouters');
    // 初始化单个模块的路由表
    moduleRouter.configModuleRouters();
    assert(moduleRouter?.moduleRouters?.isNotEmpty ?? false,
        "moduleRouter的配置数据不能为空");
    _moduleRouters.add(moduleRouter);
  }

  /// 注册路由
  static void configureRoutes(FluroRouter routers) {
    AppLog.i('configureRoutes');

    assert(_moduleRouters.isNotEmpty);

    // 配置错误路由处理器
    routers.notFoundHandler = getRouterNotFoundHandler();

    // 注册所有已添加模块的路由表
    _moduleRouters.forEach((moduleRouter) {
      moduleRouter.moduleRouters.forEach((routerName, routerHandler) {
        routers.define(routerName, handler: routerHandler);
      });
    });
  }

  /// 初始化未定义的路由
  static Handler getRouterNotFoundHandler() {
    return Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        AppLog.e('找不到路由，404:' + params.keys.toString());
        return null;
      },
    );
  }
}
