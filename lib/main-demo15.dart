import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwitchAndCheckBox Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SwitchAndCheckBox Demo'),
        ),
        body: SwitchAndCheckBoxDemo(),
      ),
    );
  }
}

class SwitchAndCheckBoxDemo extends StatefulWidget {

  @override
  _SwitchAndCheckBoxDemo createState() {
    return _SwitchAndCheckBoxDemo();
  }
}

class _SwitchAndCheckBoxDemo extends State<SwitchAndCheckBoxDemo> {

  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              }
            ),
            Switch(
              value: !_switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = !value;
                });
              }
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
            });
          }
        )
      ],
    );
  }
}