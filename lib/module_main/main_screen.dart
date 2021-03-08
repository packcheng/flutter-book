import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book/constants/res/app_strings.dart';
import 'package:flutter_book/module_permission/cubit/notification_permission_cubit.dart';
import 'package:flutter_book/routers/bundle.dart';
import 'package:flutter_book/routers/navigation_util.dart';
import 'package:flutter_book/routers/routers_name.dart';

///
/// 应用主页
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/5 3:00 PM
///
class MainScreen extends StatelessWidget {
  final Bundle bundle;

  MainScreen(this.bundle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('main'),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                NavigationUtil.start(RoutersName.pagePermissionNotification);
                BlocProvider.of<NotificationPermissionCubit>(context)
                    .checkNotificationPermStatus();
              },
              child: Text(AppStrings.pageTittleNotificationPermission),
            )
          ],
        ),
      ),
    );
  }
}
