import 'package:flutter/material.dart';
import 'package:flutter_book/constants/application.dart';
import 'package:flutter_book/constants/res/app_strings.dart';
import 'package:flutter_book/module_splash/splash_screen.dart';

///
/// 应用入口
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/5 2:55 PM
///
class FlutterBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Application.getAppRouter.generator,
      navigatorKey: Application.getNavigatorKey,
      title: '${AppStrings.appName}',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
