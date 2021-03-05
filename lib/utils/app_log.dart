import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

///
/// Log工具类
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/5 2:04 PM
///
class AppLog {
  static var _isDebug = false;
  static var _logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 120,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  //解决 log太长输出不完整问题

  static void init({@required bool isDebug}) {
    _isDebug = isDebug;
  }

  //仅Debug模式可见
  static void d(dynamic obj) {
    if (_isDebug) {
      _logger.d(obj.toString());
    }
  }

  static void e(dynamic obj) {
    if (_isDebug) {
      _logger.e(obj.toString());
    }
  }

  static void w(dynamic obj) {
    if (_isDebug) {
      _logger.w(obj.toString());
    }
  }

  static void i(dynamic obj) {
    if (_isDebug) {
      _logger.i(obj.toString());
    }
  }
}
