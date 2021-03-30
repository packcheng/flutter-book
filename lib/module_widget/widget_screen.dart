import 'package:flutter/material.dart';
import 'package:flutter_book/constants/res/app_strings.dart';
import 'package:flutter_book/routers/navigation_util.dart';
import 'package:flutter_book/routers/routers_name.dart';

///
/// 官方Widget使用案例入口页
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/8 5:11 PM
///
class WidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.systemWidgetTest),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                NavigationUtil.start(RoutersName.pageWidgetDialog);
              },
              child: Text(AppStrings.pageTittleWidgetDialog),
            ),
          ],
        ),
      ),
    );
  }
}
