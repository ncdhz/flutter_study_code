import 'package:flutter/cupertino.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoHome(),
    );
  }
}

class CupertinoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          child: Text('test'),
        ),
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Demo'),
      ),
    );
  }

}