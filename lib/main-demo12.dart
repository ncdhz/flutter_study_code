import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Demo'),
        ),
        body: ButtonDemo(),
      ),
    );
  }

}

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemo createState() {
    return _ButtonDemo();
  }

}

class _ButtonDemo extends State<ButtonDemo> {

  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: Text("发送"),
          onPressed: _onPressed,
        ),
        OutlinedButton(
          child: Text("添加"),
          onPressed: _onPressed,
        ),
        TextButton(
          child: Text("详情"),
          onPressed: _onPressed,
        ),
        IconButton(icon: Icon(Icons.thumb_up), onPressed: _onPressed),
        ElevatedButton.icon(
          onPressed: _onPressed, 
          icon: Icon(Icons.send), 
          label: Text('发送')
        ),
        OutlinedButton.icon(
          onPressed: _onPressed,
          icon: Icon(Icons.add),
          label: Text('添加')
        ),
        TextButton.icon(
          onPressed: _onPressed,
          icon: Icon(Icons.info),
          label: Text('详情')
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

}