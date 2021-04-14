import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linear Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Linear Layout Demo'),
        ),
        body: LinearLayoutDemo(),
      ),
    );
  }
}

class LinearLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // 表示子组件在Row所占用的水平空间内对齐方式
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          // 表示子组件在Row所占用的水平空间内对齐方式，
          // 如果mainAxisSize值为MainAxisSize.min，则此属性无意义
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // 表示水平方向子组件的布局顺序(是从左往右还是从右往左)
          textDirection: TextDirection.rtl,
          children: [
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // 表示水平方向子组件的布局顺序(是从左往右还是从右往左)
          textDirection: TextDirection.ltr,
          children: [
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          // 表示子组件在纵轴方向的对齐方式
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: [
            Text(" hello world ", style: TextStyle(fontSize: 30.0),),
            Text(" I am Jack "),
          ],
        ),
        Row(
          // 表示子组件在纵轴方向的对齐方式
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: [
            Text(" hello world ", style: TextStyle(fontSize: 30.0),),
            Text(" I am Jack "),
          ],
        )
      ],
    );
  }
}
