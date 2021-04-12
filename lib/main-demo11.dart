import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Demo'),
        ),
        body: DefaultTextStyleDemo(),
      ),
    );
  }

}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// textAlign：文本的对齐方式；可以选择左对齐、右对齐还是居中。
        Text(
          'Hello world',
          textAlign: TextAlign.left,
        ),
        /// maxLines、overflow：指定文本显示的最大行数，默认情况下，文本是自动折行的，
        /// 如果指定此参数，则文本最多不会超过指定的行。如果有多余的文本，
        /// 可以通过overflow来指定截断方式，默认是直接截断，
        /// 本例中指定的截断方式TextOverflow.ellipsis，它会将多余文本截断后以省略符“...”表示
        Text(
          "Hello world! I'm Jack. " * 4,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        /// 代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的fontSize，
        /// 它是调整字体大小的一个快捷方式。该属性的默认值可以通过MediaQueryData.textScaleFactor获得，
        /// 如果没有MediaQuery，那么会默认值将为1.0。
        Text(
          'Hello world',
          textScaleFactor: 1.5,
        ),
        Text("Hello world",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            height: 1.2,
            fontFamily: "Courier",
            background: new Paint()..color=Colors.yellow,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start
    );
  }

}

/// Text内容的不同部分按照不同的样式显示
class TextSpanDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
          children: [
            TextSpan(
              text: 'Home: '
            ),
            TextSpan(
              text: 'www.myhwx.com',
              style: TextStyle(
                color: Colors.blue
              ),
            )
          ]
        ))
      ],
    );
  }

}

/// 默认的文本样式，该节点的子树中所有文本都会默认使用这个样式
class DefaultTextStyleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 设置默认样式
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.red,
        fontSize: 20.0
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("hello world"),
          Text("I am Jack"),
          Text("I am Jack",
            style: TextStyle(
              inherit: false, // 不继承默认样式
              color: Colors.grey
            ),
          ),
        ],
      )
    );
  }

}