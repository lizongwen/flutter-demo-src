import 'package:flutter/material.dart';
import 'package:flutter_study/src/router/Page1.dart';
import 'package:flutter_study/src/router/Page2.dart';


class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: new ThemeData.fallback(),
      home: Scaffold(
        appBar: AppBar(
          title:Text('路由导航')
        ),
        body:RouterNavigator()
      ) ,
      routes: <String, WidgetBuilder>{
        'page1': (BuildContext context) => Page1(),
        'page2': (BuildContext context) => Page2(),
      },
    );
  }
}


class RouterNavigator extends StatefulWidget{
  @override
  _RouterNavigatorState createState() =>_RouterNavigatorState();
}
class _RouterNavigatorState extends State<RouterNavigator>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _item('跳转到page1','page1'),
        _item('跳转到page2','page2'),
      ],
    );
  }

  _item(String title,String routeName){
    return Container(
      child:RaisedButton(
        onPressed:(){
          // Navigator.pushNamed(context, routeName);
          Navigator.of(context).pushNamed(routeName);
        },
        child: Text(title),
      )
    );
  }

}