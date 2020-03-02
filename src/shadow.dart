import 'package:flutter/material.dart';

class Shadow extends StatefulWidget {
  @override
  _ShadowState createState() => _ShadowState();
}

class _ShadowState extends State<Shadow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('阴影'),
        ),
        body: FractionallySizedBox(
            widthFactor: 1,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  height: 200,
                  margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 7.0,
                          spreadRadius: -2.0),
                    ],
                  ),
                  child: Text('内容'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: PhysicalModel(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    clipBehavior: Clip.hardEdge,
                    shadowColor: Colors.cyan,
                    elevation: 8,
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(15),
                      height: 200,
                      color: Colors.blueAccent,
                      child: Text('内容'),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
