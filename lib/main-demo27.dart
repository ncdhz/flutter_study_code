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
        body: TransformDemo(),
      ),
    );
  }
}

class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                color: Colors.black54,
                child: Transform(
                  // 相对于坐标系原点的对齐方式
                  alignment: Alignment.topRight,
                  transform: Matrix4.skewY(0.3), // 沿Y轴倾斜0.3弧度
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.deepOrange,
                    child: Text('Apartment for rent!'),
                  ),
                )
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                // 默认原点为左上角，左移20像素，向上平移5像素
                child: Transform.translate(offset: Offset(-20, -5), child: Text('Hello World'),),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Transform.rotate(angle: math.pi / 2, child: Text('Hello World'),),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Transform.scale(scale: 1.5, child: Text('Hello World'),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    // 将Transform.rotate换成RotatedBox
                    // RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小
                    child: RotatedBox(
                      quarterTurns: 1, // 旋转90度(1/4圈)
                      child: Text('Hello World'),
                    ),
                  ),
                  Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
                ],
              )
            ].map((e) => Padding(padding: EdgeInsets.only(bottom: 5, top: 30), child: e,)).toList(),
          )
        ),
      ],
    );
  }
}