import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/module_widget/presentation/dialog/widget_dialog_screen.dart';
import 'package:flutter_book/module_widget/widget_screen.dart';
import 'package:flutter_book/routers/module_routers.dart';
import 'package:flutter_book/routers/routers_name.dart';

///
/// 组件测试页路由管理
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/8 5:09 PM
///
class WidgetRouters extends ModuleRoutersBase {
  @override
  void configModuleRouters() {
    moduleRouters[RoutersName.pageWidget] = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return WidgetScreen();
    });
    moduleRouters[RoutersName.pageWidgetDialog] = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return WidgetDialogScreen();
    });
  }
}
