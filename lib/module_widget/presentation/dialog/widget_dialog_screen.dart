import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_book/constants/res/app_strings.dart';
import 'package:flutter_book/utils/app_log.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

///
/// Dialog 使用案例
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/8 5:19 PM
///
class WidgetDialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.pageTittleWidgetDialog),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                showMyModalBottomSheet(context);
              },
              child: Text(AppStrings.showModalBottomSheet),
            ),
            MaterialButton(
              onPressed: () {
                showMyModalBottomSheet2(context);
              },
              child: Text(AppStrings.showModalBottomSheet),
            ),
          ],
        ),
      ),
    );
  }

  /// 显示从底部弹出的对话框
  void showMyModalBottomSheet(BuildContext context) {
    bool btnState = false;
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        AppLog.e(window.physicalSize.height.toString());
        AppLog.e(Size.fromHeight(54).height.toString());
        return Container(
            height: window.physicalSize.height * 0.3,
            width: double.infinity,
            child: OutlineButton(
                onPressed: () {
                  // 注意不是调用老页面的setState，而是要调用builder中的setBottomSheetState
                },
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: btnState ? 0.0 : 1.0,
                      child: Text("aa"),
                    ),
                  ],
                )));
      },
    );
  }

  /// 显示从底部弹出的对话框
  void showMyModalBottomSheet2(BuildContext context) {
    bool btnState = false;
    showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      builder: (BuildContext context) {
        AppLog.e(window.physicalSize.height.toString());
        AppLog.e(Size.fromHeight(54).height.toString());
        return Container(
            child: OutlineButton(
                onPressed: () {
                  // 注意不是调用老页面的setState，而是要调用builder中的setBottomSheetState
                },
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: btnState ? 0.0 : 1.0,
                      child: Text("aa"),
                    ),
                  ],
                )));
      },
    );
  }
}
