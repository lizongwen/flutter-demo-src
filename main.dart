import 'package:demo1/src/ful_group_page.dart';
import 'package:demo1/src/gesture_page.dart';
import 'package:demo1/src/layout.dart';
import 'package:demo1/src/less_group_page.dart';
import 'package:demo1/src/router/Router.dart';
import 'package:flutter/material.dart';

void main() => runApp(new GesturePage());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: new ThemeData.fallback(),
      home: Scaffold(
        appBar: AppBar(
          title:Text('main')
        ),
        body:Center(
          child:Text('Flutter DEMO')
        )
      ) ,
    );
  }
}

