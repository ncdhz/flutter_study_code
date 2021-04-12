import 'package:flutter/material.dart';

void main()=> {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: CounterWidget(),
    );
  }
}
class CounterWidget extends StatefulWidget {

  final int initValue;
  CounterWidget({Key key, this.initValue = 0}): super(key: key);

  @override
  _CounterWidget createState() {
    return _CounterWidget();
  }
}
class _CounterWidget extends State<CounterWidget> {
  int _counter;

  /// 当Widget第一次插入到Widget树时会被调用，
  /// 对于每一个State对象，Flutter framework只会调用一次该回调
  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: ()=> setState(() => ++ _counter),
          child: Text('$_counter'),
        ),
      ),
    );
  }

  /// 当State对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didUpdateWidget');
  }

  /// 当State对象从树中被移除时，会调用此回调。
  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  /// 当State对象从树中被永久移除时调用。
  /// 通常在此回调中释放资源。
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  /// 此回调是专门为了开发调试而提供的，
  /// 在热重载(hot reload)时会被调用，
  /// 此回调在Release模式下永远不会被调用。
  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  /// 在widget重新构建时，
  /// Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
  /// 然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。
  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }
}