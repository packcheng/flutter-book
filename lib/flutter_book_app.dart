import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book/constants/application.dart';
import 'package:flutter_book/constants/res/app_strings.dart';
import 'package:flutter_book/module_main/logic/cubit/app_state_cubit.dart';
import 'package:flutter_book/module_permission/cubit/notification_permission_cubit.dart';
import 'package:flutter_book/module_splash/splash_screen.dart';
import 'package:flutter_book/utils/app_log.dart';

///
/// 应用入口
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/5 2:55 PM
///
class FlutterBookApp extends StatefulWidget {
  @override
  _FlutterBookAppState createState() => _FlutterBookAppState();
}

class _FlutterBookAppState extends State<FlutterBookApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          // 监听APP前后台切换
          BlocListener<AppStateCubit, AppState>(
            listener: (context, state) {
              if (state is AppStateResumed) {
                // 恢复前台时重新检查通知权限的开启状态
                AppLog.i('App恢复前台，检查通知权限。');
                BlocProvider.of<NotificationPermissionCubit>(context)
                    .checkNotificationPermStatus();
              }
            },
          ),
          // 监听通知权限切换
          BlocListener<NotificationPermissionCubit,
              NotificationPermissionState>(
            listener: (context, state) {
              if (state is NotificationPermissionGranted) {
                AppLog.w('已成功获取通知权限，不做进一步的处理');
                return;
              }

              AppLog.e('未成功获取通知权限，需要弹窗提示');
              // TODO 弹窗提示没有成功获取通知权限
            },
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: Application.getAppRouter.generator,
          navigatorKey: Application.getNavigatorKey,
          title: '${AppStrings.appName}',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(title: 'Flutter Demo Home Page'),
        ));
  }

  @override
  void initState() {
    super.initState();
    // 首次启动，注册APP前后台状态切换监听
    WidgetsBinding.instance
        .addObserver(BlocProvider.of<AppStateCubit>(context));

    // 首次启动，检查通知权限
    BlocProvider.of<NotificationPermissionCubit>(context)
        .checkNotificationPermStatus();
  }

  @override
  void dispose() {
    BlocProvider.of<NotificationPermissionCubit>(context).close();
    BlocProvider.of<AppStateCubit>(context).close();
    super.dispose();
  }
}
