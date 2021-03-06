import 'dart:async';

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
                TabBarViewB(),
                TabBarViewC(),
                TabBarViewD(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class TabBarViewD extends StatefulWidget {
  @override
  _TabBarViewDState createState() => _TabBarViewDState();
}

class _TabBarViewDState extends State<TabBarViewD> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Offstage(
        offstage: false,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}

class TabBarViewC extends StatefulWidget {
  @override
  _TabBarViewCState createState() => _TabBarViewCState();
}

class _TabBarViewCState extends State<TabBarViewC> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.amberAccent,
      width: 100,
      height: 100,
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topLeft,
        child: Container(
          color: Colors.red,
          child: Text("FittedBox"),
        ),
      ),
    );
  }
}

class TabBarViewB extends StatefulWidget {
  @override
  _TabBarViewBState createState() => _TabBarViewBState();
}

class _TabBarViewBState extends State<TabBarViewB> {
  List<String> _data = List.generate(100, (index) {
    return "Item ${index + 1}";
  });

  //TODU
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];

          Completer<bool> _completer;

          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              _data.removeAt(index);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("$item dismissed"),
                ),
              );
            },
            onResize: () {
              print('onResize');
            },
            confirmDismiss: (direction) {
              _completer = Completer();
              return _completer.future;
            },
            background: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('NO'),
                    onPressed: () {
                      _completer.complete(false);
                    },
                  ),
                  FlatButton(
                    child: Text('YES'),
                    onPressed: () {
                      _completer.complete(true);
                    },
                  ),
                ],
              ),
            ),
            secondaryBackground: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    child: Text('NO'),
                    onPressed: () {
                      _completer.complete(false);
                    },
                  ),
                  FlatButton(
                    child: Text('YES'),
                    onPressed: () {
                      _completer.complete(true);
                    },
                  ),
                ],
              ),
            ),
            child: ListTile(
              title: Text('$item'),
            ),
          );
        },
      ),
    );
  }
}

class TabBarViewA extends StatefulWidget {
  @override
  _TabBarViewAState createState() => _TabBarViewAState();
}

class _TabBarViewAState extends State<TabBarViewA> {
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
            height: 100,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this would produce 2 rows.
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              // Generate 100 Widgets that display their index in the List
              children: List.generate(100, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                  ),
                );
              }),
            ),
          ),
          InkWell(
            // When the user taps the button, show a snackbar
            onTap: () {
              // Scaffold.of(context).showSnackBar(new SnackBar(
              //   content: new Text('Tap'),
              // ));
              Scaffold.of(context).openDrawer();
            },
            child: new Container(
              padding: new EdgeInsets.all(12.0),
              child: new Text('Flat Button'),
            ),
          )
        ],
      ),
    );
  }
}
