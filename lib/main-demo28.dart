import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transform Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transform Demo'),
        ),
        body: ContainerDemo(),
      ),
    );
  }
}
/// Container它是DecoratedBox、ConstrainedBox、
/// Transform、Padding、Align等组件组合的一个多功能容器
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 120),
              constraints: BoxConstraints.tightFor(width: 200, height: 150),
              decoration: BoxDecoration( // 背景装饰
                gradient: RadialGradient( //背景径向渐变
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.topLeft,
                  radius: .98
                ),
                boxShadow: [ // 卡片阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0
                  )
                ]
              ),
              transform: Matrix4.rotationZ(.2), // 卡片倾斜变换
              alignment: Alignment.center,
              child: Text( // 卡片文字
                "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0), //容器外补白
              color: Colors.orange,
              child: Text("Hello world!"),
            ),
            Container(
              padding: EdgeInsets.all(20.0), //容器内补白
              color: Colors.orange,
              child: Text("Hello world!"),
            ),
          ].map((e) => Padding(padding: EdgeInsets.only(top: 30), child: e,)).toList(),
        )
      ],
    );
  }
}