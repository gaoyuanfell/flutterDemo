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
                Text('11'),
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
