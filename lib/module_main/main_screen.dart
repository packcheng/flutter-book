import 'package:flutter/material.dart';
import 'package:flutter_book/routers/bundle.dart';

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
      body: Center(child: Text("aaa"),),
    );
  }
}
