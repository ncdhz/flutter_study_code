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
        body: FormDemo(),
      ),
    );
  }
}

class FormDemo extends StatefulWidget {
  @override
  _FormDemo createState() {
    return _FormDemo();
  }
}

class _FormDemo extends State<FormDemo> {

  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Form(
        key: _formKey, //设置globalKey，用于后面获取FormState
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _usernamecontroller,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或邮箱',
                icon: Icon(Icons.person)
              ),
              // 校验用户名
              validator: (v) {
                return v.trim().length > 0 ? null : '用户名不能为空';
              },
            ),
            TextFormField(
              controller: _passwordcontroller,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '您登入的密码',
                icon: Icon(Icons.lock)
              ),
              obscureText: true,
              // 校验密码
              validator: (v) {
                return v.trim().length >5 ? null : '密码不能少于6位';
              },
            ),
            Padding(padding: EdgeInsets.only(top: 28),
              child: Row(
                children: [
                  Expanded(child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                    ),
                    onPressed: () {
                      // 在这里不能通过此方式获取FormState, context 不对
                      // print(Form.of(context));

                      // 通过 _formKey.currentState 获取 FormState 后
                      // 调用 validate() 方法校验用户名和密码是否合法
                      // 校验通过后在提交数据

                      if ((_formKey.currentState as FormState).validate()) {

                      }
                    },
                    child: Text('登入'),
                  ))
                ],
              ),
            ),
            // 通过Builder来获取RaisedButton所在widget树的真正context(Element)
            Padding(padding: EdgeInsets.only(top: 28),
              child: Builder(builder: (context) {
                return Row(
                  children: [
                    Expanded(child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                            backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                        ),
                        onPressed: () {
                          //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                          if (Form.of(context).validate()) {

                          }
                        },
                        child: Text('登入'),
                      )
                    )
                  ],
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}