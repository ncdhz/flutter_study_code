import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Demo'),
        ),
        body: ImageDemo(),
      ),
    );
  }
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 本地图片
          /// 本地图片的资源应该从在 pubspec.yaml 中，flutter.assets 中添加
          Text('本地图片'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image(
                image: AssetImage("assets/images/avatar.png"),
                width: 100.0
            ),
          ),
          Text('本地图片'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/avatar.png', width: 100,),
          ),
          /// 网络加载图片
          Text('网络图片'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image(
              image: NetworkImage(
                  'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'
              ),
              width: 100,
            ),
          ),
          Text('网络图片'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.network('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4', width: 100,),
          ),
          /// 该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式
          Text('BoxFit.fill'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/avatar.png', width: 100, fit: BoxFit.fill,),
          ),
          Text('BoxFit.contain'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/avatar.png', width: 100, fit: BoxFit.contain,),
          ),
          Text('BoxFit.cover'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/avatar.png', width: 100, fit: BoxFit.cover,),
          ),
          Text('BoxFit.fitWidth'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/avatar.png', width: 100, fit: BoxFit.fitWidth,),
          ),
          Text('BoxFit.fitHeight'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/avatar.png', width: 100, fit: BoxFit.fitHeight,),
          ),
          Text('BoxFit.scaleDown'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/avatar.png', width: 100, fit: BoxFit.scaleDown,),
          ),
          Text('BoxFit.none'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/avatar.png', width: 100, fit: BoxFit.none,),
          ),
          /// color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，
          /// color指定混合色，而colorBlendMode指定混合模式
          Text('color、colorBlendMode'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/avatar.png',
              width: 100,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
          ),
          /// 当图片本身大小小于显示空间时，指定图片的重复规则
          Text('repeat'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/avatar.png',
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY ,
            ),
          ),
        ],
      ),
    );
  }
}
