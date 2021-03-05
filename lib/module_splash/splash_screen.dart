import 'package:flutter/material.dart';
import 'package:flutter_book/routers/navigation_util.dart';

///
/// 启动页
///
/// @author packcheng <a href="mailto:packcheng_jo@outlook.com">Contact me.</a>
/// @since 2021/3/4 5:40 PM
///

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'aaa',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationUtil.goHomePage();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
