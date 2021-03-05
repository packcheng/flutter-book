import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/module_main/main_screen.dart';
import 'package:flutter_book/routers/module_routers.dart';
import 'package:flutter_book/routers/routers_name.dart';

///
/// 项目主页路由
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/5 2:12 PM
///
class MainRouters extends ModuleRoutersBase {
  @override
  void configModuleRouters() {
    moduleRouters[RoutersName.pageMain] = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return MainScreen(null);
    });
  }
}
