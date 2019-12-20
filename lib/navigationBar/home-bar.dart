import 'package:flutter/material.dart';

class HomeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取设备信息
    var boxWidth = MediaQuery.of(context).size.width / 4;
    return Container(
      width: double.infinity,
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Column(children: <Widget>[
          Container(
            width: double.infinity,
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Color(0xff333333),
              labelColor: Colors.blue,
              labelPadding: EdgeInsets.only(top: 10),
              tabs: [
                Container(
                  width: boxWidth,
                  child: Column(
                    children: <Widget>[Icon(Icons.directions_car), Text('CAR')],
                  ),
                ),
                Container(
                  width: boxWidth,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.directions_bike),
                      Text('BICYCLE')
                    ],
                  ),
                ),
                Container(
                  width: boxWidth,
                  child: Column(
                    children: <Widget>[Icon(Icons.directions_bus), Text('BUS')],
                  ),
                ),
                Container(
                  width: boxWidth,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.directions_railway),
                      Text('TRAIN')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: <Widget>[
                TabBarViewA(),
                Text('22'),
                Text('33'),
                Text('44'),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class TabBarViewA extends StatefulWidget {
  @override
  TabBarViewAState createState() => TabBarViewAState();
}

class TabBarViewAState extends State<TabBarViewA> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print('MyButton was tapped!');
            },
            child: Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.lightGreen[500],
              ),
              child: Center(
                child: Text('Engage'),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this would produce 2 rows.
              crossAxisCount: 3,
              // Generate 100 Widgets that display their index in the List
              children: List.generate(100, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
