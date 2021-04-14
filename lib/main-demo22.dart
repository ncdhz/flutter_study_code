import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack Layout Demo'),
        ),
        body: StackLayoutDemo(),
      ),
    );
  }
}

class StackLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 通过ConstrainedBox来确保Stack占满屏幕
    return ConstrainedBox(constraints: BoxConstraints.expand(),
      child: Stack(
        // 指定未定位或部分定位widget的对齐方式
        alignment: Alignment.center,
//        fit: StackFit.expand, // 未定位widget占满Stack整个空间
        children: [
          Positioned(child: Text('I am Jack'), left: 18,),
          // 占满Stack整个空间会遮挡 I am Jack
          Container(
            child: Text('Hello World', style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(child: Text('Your friend'), top: 18,)
        ],
      ),
    );
  }
}