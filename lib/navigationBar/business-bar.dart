import 'package:flutter/material.dart';

class BusinessBar extends StatefulWidget {
  @override
  _BusinessBarState createState() => _BusinessBarState();
}

class _BusinessBarState extends State<BusinessBar> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener((){
      print('ok');
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    int newIndex = _tabController.index + delta;
    if (newIndex < 0) {
      newIndex = _tabController.length - 1;
    } else if (newIndex >= _tabController.length) {
      newIndex = 0;
    }
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    var boxWidth = MediaQuery.of(context).size.width / 4;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                _nextPage(-1);
              },
            ),
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () {
                _nextPage(1);
              },
            ),
          ],
        ),
        TabPageSelector(controller: _tabController),
        Container(
          width: double.infinity,
          child: TabBar(
            controller: _tabController,
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
            controller: _tabController,
            children: <Widget>[
              Text('11'),
              Text('22'),
              Text('33'),
              Text('44'),
            ],
          ),
        )
      ],
    );
  }
}
