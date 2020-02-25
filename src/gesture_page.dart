import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = '';
  double moveX = 0, moveY = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何检测手势事件'),
          leading: GestureDetector(onTap: () {
            Navigator.pop(context);
          }),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _printMsg('点击'),
                      onDoubleTap: () => _printMsg('双击'),
                      onLongPress: () => _printMsg('长按'),
                      onTapCancel: () => _printMsg('取消'),
                      onTapUp: (e) => _printMsg('松开'),
                      onTapDown: (e) => _printMsg('按下'),
                      child: Container(
                        padding: EdgeInsets.all(60),
                        decoration: BoxDecoration(color: Colors.blueAccent),
                        child: Text('点我', style: TextStyle(fontSize: 36)),
                      ),
                    ),
                    Text(printString)
                  ]),
              Positioned(
                  left: moveX,
                  top: moveY,
                  child: GestureDetector(
                    onPanUpdate: (e) => _doMove(e),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.greenAccent),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      printString += ' ,${msg}';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }
}
