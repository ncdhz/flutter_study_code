import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField Demo'),
        ),
        body: TextFieldDecorationDemo(),
      ),
    );
  }
}

/// 自定义样式
class TextFieldDecorationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: '请输入用户名',
              prefixIcon: Icon(Icons.person),
              // 未获得焦点下划线设为灰色
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
              ),
              // 获得焦点下划线设为蓝色
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)
              )
            ),
          ),
          /// 主题中可以通过inputDecorationTheme来设置输入框默认的decoration。
          /// 所以我们可以通过主题来自定义 TextField 的样式
          Theme(data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200],
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: Colors.grey
              ),
              hintStyle: TextStyle(
                color: Colors.grey
              )
            )
          ), child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: '密码',
                  hintText: '您登入的密码',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13)
                ),
              )
            ],
          )),
          /// 通过Container去嵌套定义样式
          Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: '电子邮箱地址',
                prefixIcon: Icon(Icons.email),
                border: InputBorder.none
              ),
            ),
            decoration: BoxDecoration(
              // 下滑线浅灰色，宽度1像素
              border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1))
            ),
          )
        ],
      ),
    );
  }

}

/// 用于测试焦点
class TextFieldFocusDemo extends StatefulWidget {
  @override
  _TextFieldFocusDemo createState() {
    return _TextFieldFocusDemo();
  }
}

class _TextFieldFocusDemo extends State<TextFieldFocusDemo> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10), child: Column(
      children: [
        TextField(
          autofocus: true,
          focusNode: focusNode1,
          decoration: InputDecoration(
            labelText: 'input1'
          ),
        ),
        TextField(
          focusNode: focusNode2,
          decoration: InputDecoration(
            labelText: 'input2'
          ),
        ),
        Builder(builder: (ctx) {
          return Column(
            children: [
              ElevatedButton(onPressed: () {
                /// 将焦点切换
                if (focusNode1.hasFocus) {
                  FocusScope.of(context).requestFocus(focusNode2);
                } else {
                  FocusScope.of(context).requestFocus(focusNode1);
                }
              }, child: Text('移动焦点')),
              ElevatedButton(
                onPressed: () {
                  /// 当所有编辑框都失去焦点时键盘就会收起
                  focusNode2.unfocus();
                  focusNode1.unfocus();
                },
                child: Text('隐藏键盘'),
              )
            ],
          );
        })
      ],
    ));
  }
}


class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemo createState() {
    return _TextFieldDemo();
  }
}

class _TextFieldDemo extends State<TextFieldDemo> {
  //定义一个controller
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _selectionController =  TextEditingController();
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      print(_passwordController.text);
    });
    _selectionController.text = 'hello world';
    _selectionController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _selectionController.text.length
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10), child: Column(
      children: [
        TextField(
          /// 是否自动获取焦点
          autofocus: true,
          /// 监听文本变化
          onChanged: (v) {
            print('onChanged：$v');
          },
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '电话号码或邮箱',
            prefixIcon: Icon(Icons.person)
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: '密码',
            hintText: '您的登入密码',
            prefixIcon: Icon(Icons.lock)
          ),
          /// 是否隐藏正在编辑的文本
          obscureText: true,
          /// 编辑框的控制器，
          /// 通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件
          controller: _passwordController,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: '测试选择',
          ),
          controller: _selectionController,
        )
      ],
    ),);
  }
}

