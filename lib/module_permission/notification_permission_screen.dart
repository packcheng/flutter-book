import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book/constants/res/app_strings.dart';
import 'package:flutter_book/module_permission/cubit/notification_permission_cubit.dart';
import 'package:flutter_book/module_permission/utils/permission_utils.dart';

///
/// 通知权限检查测试页
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/8 11:44 AM
///
class NotificationPermissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.pageTittleNotificationPermission),
        ),
        body: Center(
            child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<NotificationPermissionCubit,
                              NotificationPermissionState>(
                          builder: (context, state) => Text(
                              "${state is NotificationPermissionGranted ? AppStrings.notificationPermissionGranted : AppStrings.notificationPermissionDeny}")),
                      BlocBuilder<NotificationPermissionCubit,
                          NotificationPermissionState>(
                        builder: (context, state) => Offstage(
                          offstage: (state is NotificationPermissionGranted),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              FlatButton(
                                color: Colors.amber,
                                child: Text(AppStrings
                                    .requestNotificationPermission
                                    .toUpperCase()),
                                onPressed: () {
                                  // show the dialog/open settings screen
                                  PermissionUtils
                                          .requestNotificationPermissions()
                                      .then((_) {
                                    // when finished, check the permission status
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ]))));
  }
}
