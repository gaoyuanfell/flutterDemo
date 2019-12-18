import 'package:flutter/material.dart';

class MaterialDemo extends StatefulWidget {
  MaterialDemo({Key key, this.id, this.title}) : super(key: key);

  final String title;
  final num id;

  @override
  _MaterialDemoState createState() => _MaterialDemoState();
}

class _MaterialDemoState extends State<MaterialDemo> {
  num currentIndex = 0;

  var pages = [
    Text('HOME1'),
    Text('HOME2'),
    Text('HOME3'),
    Text('HOME4'),
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem buildNavigationBarItem(
        IconData icon, String title) {
      return BottomNavigationBarItem(
          title: Text(
            title,
            style: TextStyle(color: Colors.blue),
          ),
          icon: Icon(
            icon,
            color: Colors.blue,
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialDemo'),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          buildNavigationBarItem(Icons.home, 'HOME'),
          buildNavigationBarItem(Icons.home, 'HOME'),
          buildNavigationBarItem(Icons.home, 'HOME'),
          buildNavigationBarItem(Icons.home, 'HOME'),
        ],
        onTap: (index) {
          print(index);
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
