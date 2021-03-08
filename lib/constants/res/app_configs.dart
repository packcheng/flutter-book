import 'package:fluro/fluro.dart';

///
/// 应用配置常量定义
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/4 5:48 PM
///
class AppConfigs {
  /// 应用日志打印开关
  static const bool isDebug = true;

  /// 定义路由动画时间，单位毫秒
  static const transitionDurationFast = 200;
  static const transitionDurationNormal = 300;
  static const transitionDurationSlow = 500;

  /// 默认页面切换路由动画
  static const TransitionType transitionTypeCommon = TransitionType.inFromRight;

  /// sp保存数据的key
  static const String spKeyCookie = 'cookie'; // 保存用户登录的cookie
}
