import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flex Layout Demo'),
        ),
        body: FlexLayoutDemo(),
      ),
    );
  }
}

class FlexLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // Flex的两个子widget按1：2来占据水平空间
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Container(
                height: 30,
                color: Colors.red,
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                height: 30,
                color: Colors.blue,
              ),
              flex: 2,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 100,
            // Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
