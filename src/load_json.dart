import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LoadJson extends StatefulWidget {
  @override
  _LoadJsonState createState() => _LoadJsonState();
}

class _LoadJsonState extends State<LoadJson> {
  String json = '';
  Future<String> _loadJson() async {
    String res = await rootBundle.loadString('json/data.json');
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('导入json'),
        ),
        body: FractionallySizedBox(
            child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                String res = await _loadJson();
                setState(() {
                  json = res;
                });
              },
              child: Container(
                width: 100,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Text(
                  '导入json',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Text(json)
          ],
        )),
      ),
    );
  }
}
