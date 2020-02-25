import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StatelessWidget与基础组件',
        home: Scaffold(
          appBar: AppBar(title: Text('StatelessWidget与基础组件')),
          body: ListView(children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              child: Column(children: <Widget>[
                Text('I am text', style: TextStyle(fontSize: 20)),
              ]),
            ),
            Icon(Icons.android, color: Colors.red),
            CloseButton(),
            BackButton(),
            Divider(
              color: Colors.red,
              height: 10, //线容器的高度，看不见
              indent: 20, //线左缩进
            ),
            Card(
              color: Colors.orangeAccent,
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text('I am Card'),
              ),
            ),
            AlertDialog(
              title:Text('弹框'),
              content:Text('李惟晨小乖乖')
            )
          ]),
        ));
  }
}
