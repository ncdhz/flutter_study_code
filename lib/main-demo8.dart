import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/', //名为"/"的路由作为应用的home(首页)
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      // 注册路由表
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
      },
      /**
       * 如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件；
       * 如果路由表中没有注册，才会调用onGenerateRoute来生成路由。
       */
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context){
          String routeName = settings.name;
          print(routeName);
          return new NewRoute(text: settings.arguments);
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter ++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You have pushed the button this many times:'
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'new_page', arguments: 'hi');
              },
              child: Text('open new route'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.red)
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewRoute extends StatelessWidget{
  final String text;
  NewRoute({Key key, this.text}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Route'),
      ),
      body: Center(
        child: Text(
          text
        ),
      ),
    );
  }
}