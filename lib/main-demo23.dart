import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Align Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Align Layout Demo'),
        ),
        body: AlignLayoutDemo(),
      ),
    );
  }
}

class AlignLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          width: 120,
          color: Colors.blue[50],
          // Align只能有一个子元素
          child: Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Container(
          color: Colors.brown,
          // 通过子元素确定父元素大小
          // widthFactor 子元素width的倍数
          // alignment 子元素在父元素中的起始位置
          child: Align(
            widthFactor: 2,
            heightFactor: 2,
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Container(
          color: Colors.red,
          // 通过子元素确定父元素大小
          // widthFactor 子元素width的倍数
          // alignment 子元素在父元素中的起始位置
          child: Align(
            widthFactor: 2,
            heightFactor: 2,
            // 以矩形中心为定位点，位置计算可以参考下面公式
            // (Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
            alignment: Alignment(2, 0),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            // 矩形的左侧顶点为定位点
            // 实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
            alignment: FractionalOffset(0.2, 0.6),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        )
      ],
    );
  }
}