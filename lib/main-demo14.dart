import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Demo'),
        ),
        body: IconDemo(),
      ),
    );
  }
}

/// 使用 Material Design 字体前
/// 需要在 pubspec.yaml 文件中打开 uses-material-design 设置
/// flutter:
///   uses-material-design: true
class IconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    // call: &#xE914; or 0xE914 or E914
    icons += "\uE914";
    // return: &#xE000; or 0xE000 or E000
    icons += " \uE000";
    // lay: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return Column(
      children: [
        Text(
          icons,
          style: TextStyle(
              fontFamily: 'MaterialIcons',
              fontSize: 24,
              color: Colors.grey
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.accessible,color: Colors.green,),
            Icon(Icons.error,color: Colors.green,),
            Icon(Icons.fingerprint,color: Colors.green,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(MyIcons.chineseCabbage,),
            Icon(MyIcons.beanSprouts,)
          ],
        )
      ],
    );
  }
}

/// 自定义字体图标
/// 导入字体，其中字体文件为 ttf
/// fonts:
///  - family: myIcon  #指定一个字体名
///    fonts:
///      - asset: fonts/iconfont.ttf
class MyIcons {
  // 白菜
  static const chineseCabbage = IconData(
    0xe7ec,
    matchTextDirection: true,
    fontFamily: 'myIcon'
  );

  // 豆芽
  static const beanSprouts = IconData(
    0xe7ed,
    matchTextDirection: true,
    fontFamily: 'myIcon'
  );
}
