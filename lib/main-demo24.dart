import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padding Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Padding Demo'),
        ),
        body: PaddingDemo(),
      ),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 上下左右各添加16像素补白
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            // 左边添加8像素补白
            padding: EdgeInsets.only(left: 8),
            child: Text('Hello world'),
          ),
          Padding(
            // 上下各添加8像素补白
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('I am Jack'),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text('Your friend'),
          )
        ],
      ),
    );
  }
}