import 'package:flutter/material.dart';

void main() => {
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Demo',
      home: ScaffoldDemo()
    );
  }
}

class ScaffoldDemo extends StatefulWidget{
  @override
  _ScaffoldDemo createState() {
    return _ScaffoldDemo();
  }
}

class _ScaffoldDemo extends State<ScaffoldDemo> with SingleTickerProviderStateMixin{
  int _selectedIndex = 1;
  TabController _tabController; //需要定义一个Controller

  List tabs = ["新闻", "历史", "图片"];
  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
        bottom: TabBar( //生成Tab菜单
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      drawer: MyDrawer(),
//      bottomNavigationBar: BottomNavigationBar(
//        items: [
//          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
//          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School')
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home)),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,// 均分底部导航栏横向空间
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) => Container(
          alignment: Alignment.center,
          child: Text(e, textScaleFactor: 5,),
        )).toList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 38),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    'NCDHZ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}