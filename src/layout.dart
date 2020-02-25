import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('基础布局')),
          body: ListView(
            children: <Widget>[
              Container(
                  child: Column(
                children: <Widget>[
                  ClipOval(
                    child: Image.network('http://www.devio.org/img/avatar.png',
                        width: 100, height: 100),
                  ),
                ],
              )),
              // ClipOval裁切圆形头像
              Padding(
                padding: EdgeInsets.all(15),
                //ClipRRect裁切矩形圆角，不能设置阴影
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Opacity(
                    opacity: 0.6,
                    child: Image.network(
                      'http://www.devio.org/img/avatar.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(10),
                //PhysicalModel设置圆角和阴影，z轴高度
                child: PhysicalModel(
                    clipBehavior: Clip.antiAlias, //抗锯齿
                    shadowColor: Colors.orangeAccent, //阴影
                    elevation: 10,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: PageView(
                      children: <Widget>[
                        _item('Page1', Colors.deepPurple),
                        _item('Page2', Colors.green),
                        _item('Page3', Colors.red)
                      ],
                    )),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Text('宽度撑满'),
                ),
              ),
              Stack(children: <Widget>[
                Image.network(
                  'http://www.devio.org/img/avatar.png',
                  width: 100,
                  height: 100,
                ),
                Positioned(
                    child: Image.network(
                      'http://www.devio.org/img/avatar.png',
                      width: 20,
                      height: 20,
                    ),
                    right: 0,
                    bottom: 0)
              ]),
              Wrap(
                
                // spacing:8,//水平边距
                // runSpacing: -16,//垂直边距
                children: <Widget>[
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                  _chip('Flutter'),
                ],
              )
            ],
          )),
    );
  }

  _chip(String label) {
    // return Text(label);
    return Chip(
      // labelPadding:EdgeInsets.all(0),
      label: Text(label),
      avatar: ClipOval(
        child: Image.network(
          'http://www.devio.org/img/avatar.png',
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
