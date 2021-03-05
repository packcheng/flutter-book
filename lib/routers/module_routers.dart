import 'package:fluro/fluro.dart';
import 'package:flutter_book/routers/routers_name.dart';

///
/// 模块路由基类
///
/// 每个模块都需要在该模块中注册和管理自己的页面
/// 路由名称统一在[RoutersName]中管理配置
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/5 11:45 AM
///
abstract class ModuleRoutersBase {
  Map<String, Handler> _routers = {};

  Map<String, Handler> get moduleRouters {
    return _routers;
  }

  /// 配置模块路由
  /// 1、在[RoutersName]中设置路由名
  /// 2、在该方法内部注册当前模块的所有页面
  void configModuleRouters();
}
