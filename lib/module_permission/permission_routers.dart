import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/module_permission/notification_permission_screen.dart';
import 'package:flutter_book/routers/module_routers.dart';
import 'package:flutter_book/routers/routers_name.dart';

///
/// 权限使用示例页入口
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/8 11:43 AM
///
class PermissionRouters extends ModuleRoutersBase {
  @override
  void configModuleRouters() {
    moduleRouters[RoutersName.pagePermissionNotification] = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return NotificationPermissionScreen();
    });
  }
}
