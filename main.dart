import 'package:flutter/material.dart';
import 'package:flutter_study/src/animation.dart';
import 'package:flutter_study/src/async.dart';
import 'package:flutter_study/src/isolate.dart';
import 'package:flutter_study/src/router/Router.dart';
import 'package:flutter_study/src/shadow.dart';

void main() => runApp(new IsolateApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: new ThemeData.fallback(),
      home: Scaffold(
          appBar: AppBar(title: Text('main')),
          body: Center(child: Text('Flutter DEMO'))),
    );
  }
}
