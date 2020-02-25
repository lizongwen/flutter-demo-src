import 'package:flutter/material.dart';

class FulGroupPage extends StatefulWidget {
  @override
  _FulGroupPageState createState() => _FulGroupPageState();
}

class _FulGroupPageState extends State<FulGroupPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StatefulWidget与基础组件',
        home: Scaffold(
            appBar: AppBar(title: Text('StatefulWidget与基础组件')),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.grey),
                    activeIcon: Icon(Icons.home, color: Colors.blue),
                    title: Text('首页')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list, color: Colors.grey),
                    activeIcon: Icon(Icons.list, color: Colors.blue),
                    title: Text('列表'))
              ],
            ),
            body: _currentIndex == 0
                ? RefreshIndicator(
                    child: ListView(
                      children: <Widget>[
                        Container(child: Text('首页')),
                        TextField(
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText: '请输入内容',
                              hintStyle: TextStyle(fontSize: 15)),
                        )
                      ],
                    ),
                    onRefresh: _handleRefresh)
                : Text('列表')));
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }
}
