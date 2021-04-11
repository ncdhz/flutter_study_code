import 'package:flutter/material.dart';
void main()=> {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由传值',
      home: Scaffold(
        appBar: AppBar(
          title: Text('路由传值'),
        ),
        body: RouterTestRoute()
      )
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ElevatedButton(
        onPressed: () async {
          var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TipRoute(text: '猜猜我传的啥');
          }));
          //输出`TipRoute`路由返回结果
          print("路由返回值: $result");
        },
        child: Text('打开'),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  final String text;
  TipRoute({Key key, this.text}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('被传值页面'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              Text(text),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, '我是返回值');
                  },
                  child: Text('返回')
              )
            ],
          ),
        ),
      ),
    );
  }
}