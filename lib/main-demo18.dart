import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Demo'),
        ),
        body: ProgressIndicatorAnimationDemo(),
      ),
    );
  }
}

class ProgressIndicatorAnimationDemo extends StatefulWidget {
  @override
  _ProgressIndicatorAnimationDemo createState() {
    return _ProgressIndicatorAnimationDemo();
  }
}

class _ProgressIndicatorAnimationDemo extends State<ProgressIndicatorAnimationDemo>
  with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  @override
  void initState() {
    // 动画执行时间3秒
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(()=>{}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(16), child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: ColorTween(
              begin: Colors.grey,
              end: Colors.blue
            ).animate(_animationController),
            value: _animationController.value,
          ),)
        ],
      ),
    );
  }
}

class ProgressIndicatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: .5,
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: .5,
        ),
        // 其实LinearProgressIndicator和CircularProgressIndicator都是取父容器的尺寸作为绘制的边界的
        // 通过 ConstrainedBox、SizedBox 指定尺寸
        SizedBox(
          height: 2,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
        ),
        // 如果CircularProgressIndicator显示空间的宽高不同，则会显示为椭圆
        SizedBox(
          height: 100,
          width: 130,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .7,
          ),
        ),
      ].map((e) => Padding(padding: EdgeInsets.all(20), child: e,)).toList(),
    );
  }
}