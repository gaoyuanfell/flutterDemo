import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'layout-first.dart';
import 'random-words.dart';

void main() {
  debugPaintSizeEnabled = true; // 展示所有盒子范围
  // debugPaintPointersEnabled = true; // 展示可点击区域范围
  // debugPaintLayerBordersEnabled = true; // 所有layer展示橙色边框
  // debugRepaintRainbowEnabled = true; // 炫彩边框效果
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonList = <Widget>[
      RaisedButton(
        child: Text(
          '无限滚动',
          style: TextStyle(color: const Color(0xFFFFFFFF)),
        ),
        color: Colors.lightBlue,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return RandomWords();
          }));
        },
      ),
      RaisedButton(
        child: Text(
          '布局',
          style: TextStyle(color: const Color(0xFFFFFFFF)),
        ),
        color: Colors.lightBlue,
        onPressed: () {
          print('布局');
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return LayoutFirst();
          }));
        },
      ),
      RaisedButton(
        child: Text(
          '添加交互',
          style: TextStyle(color: const Color(0xFFFFFFFF)),
        ),
        color: Colors.lightBlue,
        onPressed: () {
          print('添加交互');
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('导航'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: buttonList,
      ),
    );
  }
}
