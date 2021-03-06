import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'formDemo.dart';
import 'layout-api.dart';
import 'layout-demo.dart';
import 'material-demo.dart';
import 'random-words.dart';

void main() {
  // debugPaintSizeEnabled = true; // 展示所有盒子范围
  // debugPaintPointersEnabled = true; // 展示可点击区域范围
  // debugPaintLayerBordersEnabled = true; // 所有layer展示橙色边框
  // debugRepaintRainbowEnabled = true; // 炫彩边框效果
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: theme.textTheme.copyWith(
            body2: theme.textTheme.body2.copyWith(color: Colors.black),
          )),
      home: HomePage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
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
            return LayoutApi();
          }));
        },
      ),
      RaisedButton(
        child: Text(
          '布局Demo',
          style: TextStyle(color: const Color(0xFFFFFFFF)),
        ),
        color: Colors.lightBlue,
        onPressed: () {
          print('布局Demo');
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return LayoutDemo();
          }));
        },
      ),
      RaisedButton(
        child: Text(
          '表单',
          style: TextStyle(color: const Color(0xFFFFFFFF)),
        ),
        color: Colors.lightBlue,
        onPressed: () {
          print('表单');
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FormDemo();
          }));
        },
      ),
      RaisedButton(
        child: Text(
          'App结构',
          style: TextStyle(color: const Color(0xFFFFFFFF)),
        ),
        color: Colors.lightBlue,
        onPressed: () {
          print('App结构');
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            // 测试路由传参和出参
            return MaterialDemo(id: 1, title: '测试');
          }));
        },
      ),
    ];

    final Widget _floatingActionButton = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('Add'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('导航'),
      ),
      body: Container(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: buttonList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //   ],
      // ),
    );
  }
}
