import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container Demo'),
        ),
        body: ContainerDemo(),
      ),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

    return Column(
      children: [
        ConstrainedBox(
          // BoxConstraints 的 minHeight 产生了效果, Container 的高度最小为 50
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: 50
          ),
          child: Container(
            height: 5,
            child: redBox,
          ),
        ),
        // 等价于下面的代码
        SizedBox(
            width: 80.0,
            height: 80.0,
            child: redBox
        ),
        // 等价于下面的代码
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
          child: redBox,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0),
          child: redBox,
        ),
        // 多重限制
        // 中和生效
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
              child: redBox,
            )
        ),
        // UnconstrainedBox不会对子组件产生任何限制
        // 父组件限制的“去除”并非是真正的去除：下面例子中虽然红色区域大小是90×20，
        // 但上方仍然有80的空白空间
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
            child: UnconstrainedBox( //“去除”父级限制
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                child: redBox,
              ),
            )
        )
      ].map((e) => Padding(padding: EdgeInsets.only(bottom: 10), child: e)).toList(),
    );
  }
}