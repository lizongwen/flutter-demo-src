import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IsolateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IsolateAppPage(),
    );
  }
}

class IsolateAppPage extends StatefulWidget {
  IsolateAppPage({Key key}) : super(key: key);

  @override
  _IsolateAppPageState createState() => _IsolateAppPageState();
}

class _IsolateAppPageState extends State<IsolateAppPage> {
  List widgets = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: getBody());
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    // 打开ReceivePort以接收传入的消息
    ReceivePort receivePort = ReceivePort();
    print('1');
    print(receivePort);
    print(receivePort.sendPort);
    //创建并生成与当前Isolate共享相同代码的Isolate
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    print('2');
    // 流的第一个元素
    SendPort sendPort = await receivePort.first;
    print('6');
    print(sendPort);
    // 流的第一个元素被收到后监听会关闭，所以需要新打开一个ReceivePort以接收传入的消息
    ReceivePort response = ReceivePort();
    print('7');
    //通过此发送端口向其对应的“ReceivePort”①发送异步[消息]，这个“消息”指的是发送的参数②。
    sendPort.send(
        ["https://jsonplaceholder.typicode.com/posts", response.sendPort]);
    print('8');
    // 获取端口发送来的数据③
    List msg = await response.first;
    print('12');
    setState(() {
      widgets = msg;
    });
  }

  // isolate的入口函数，该函数会在新的Isolate中调用，Isolate.spawn的message参数会作为调用它时的唯一参数
  static dataLoader(SendPort sendPort) async {
    print('3');
    print(sendPort);
    // 打开ReceivePort①以接收传入的消息
    ReceivePort port = ReceivePort();
    print('4');
    print(port);
    // 通知其他的isolates，本isolate 所监听的端口
    sendPort.send(port.sendPort);
    print('5');
    // 获取其他端口发送的异步消息 msg② -> ["https://jsonplaceholder.typicode.com/posts", response.sendPort]
    await for (var msg in port) {
      print('9');
      //等价于List msg= await port.first;
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataURL = data;
      http.Response response = await http.get(dataURL);
      print('10');
      // 其对应的“ReceivePort”发送解析出来的JSON数据③
      replyTo.send(json.decode(response.body));
      print('11');
    }
    // List msg = await port.first;
    // print('9');
    // //等价于List msg= await port.first;
    // String data = msg[0];
    // SendPort replyTo = msg[1];

    // String dataURL = data;
    // http.Response response = await http.get(dataURL);
    // print('10');
    // // 其对应的“ReceivePort”发送解析出来的JSON数据③
    // replyTo.send(json.decode(response.body));
    // print('11');
  }
}
