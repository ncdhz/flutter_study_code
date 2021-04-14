import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clip Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clip Demo'),
        ),
        body: ClipDemo(),
      )
    );
  }
}

class ClipDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Widget avatar = Image.asset("assets/images/avatar.png", width: 60.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            avatar, // 不剪裁
            ClipOval( // 剪裁为圆形
              child: avatar,
            ),
            ClipRRect( // 剪裁为圆角矩形
              borderRadius: BorderRadius.circular(5.0),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,// 宽度设为原来宽度一半，另一半会溢出
                  child: avatar,
                ),
                Text(
                  '你好世界',
                  style: TextStyle(
                    color: Colors.green
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 剪裁子组件到实际占用的矩形大小
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, //宽度设为原来宽度一半
                    child: avatar,
                  ),
                ),
                Text(
                  '你好世界',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            ClipRect(
                clipper: MyClipper(), //使用自定义的clipper
                child: avatar
            ),
          ],
        )
      ],
    );
  }
}

// 自定义一个CustomClipper
class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(10, 15, 40, 30);
  }

  /// 接口决定是否重新剪裁。
  /// 如果在应用中，剪裁区域始终不会发生变化时应该返回false
  /// 如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），
  /// 那么变化后应该返回true
  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}