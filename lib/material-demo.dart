import 'package:flutter/material.dart';

import 'drawerDemo.dart';
import 'navigationBar/home-bar.dart';
import 'navigationBar/business-bar.dart';
import 'navigationBar/image-bar.dart';
import 'navigationBar/school-bar.dart';

class MaterialDemo extends StatefulWidget {
  MaterialDemo({Key key, this.id, this.title}) : super(key: key);

  final String title;
  final num id;

  @override
  _MaterialDemoState createState() => _MaterialDemoState();
}

class _MaterialDemoState extends State<MaterialDemo> {
  int _currentIndex = 0;

  List _pages = [
    HomeBar(),
    BusinessBar(),
    SchoolBar(),
    ImageBar(),
  ];

  @override
  Widget build(BuildContext context) {
    // 气泡
    final _qipao = Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Icon(Icons.home),
        Positioned(
          child: Container(
            child: Center(
                child: Text('99',
                    style: TextStyle(fontSize: 10, color: Colors.white))),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(9)),
            width: 18,
            height: 18,
          ),
          top: -5,
          right: -5,
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialDemo'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          PopupMenuButton(
            offset: Offset(10, 10),
            onSelected: (int index) {
              print(index);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('1'),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text('2'),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text('3'),
                ),
                PopupMenuItem<int>(
                  value: 4,
                  child: Text('4'),
                ),
              ];
            },
          )
        ],
      ),
      drawer: DrawerDemo(),
      drawerEdgeDragWidth: 30,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _qipao,
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text('Image'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Color(0x737373FF),
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
