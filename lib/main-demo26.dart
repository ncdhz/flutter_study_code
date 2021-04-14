import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decorated Box Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Decorated Box Demo'),
        ),
        body: DecoratedBoxDemo(),
      ),
    );
  }
}

class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
              borderRadius: BorderRadius.circular(3.0), //3像素圆角
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2, 2),
                    blurRadius: 4.0
                )
              ]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
            child: Text('Login', style: TextStyle(color: Colors.white),),
          ),
        )
      ],
    );
  }
}