import 'package:flutter/material.dart';

class LayoutApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      ListTile(
        title: Text('RichText'),
      ),
      ListTile(
        title: Text('ListBody'),
      ),
      ListBody(
        mainAxis: Axis.vertical,
        reverse: true,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 10.0,
            height: 50.0,
          ),
          Container(
            color: Colors.yellow,
            width: 10.0,
            height: 50.0,
          ),
          Container(
            color: Colors.green,
            width: 10.0,
            height: 50.0,
          ),
          Container(
            color: Colors.blue,
            width: 10.0,
            height: 50.0,
          ),
          Container(
            color: Colors.black,
            width: 10.0,
            height: 50.0,
          ),
        ],
      ),
      ListTile(
        title: Text('IndexedStack'),
      ),
      Container(
        child: IndexedStack(
          index: 0,
          children: <Widget>[
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4'),
          ],
        ),
      ),
      ListTile(
        title: Text('Align'),
      ),
      Container(
        color: Colors.blue[50],
        child: Align(
          widthFactor: 1,
          // heightFactor: 3,
          alignment: FractionalOffset(0, 0),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
      Container(
        color: Colors.blue[50],
        child: Align(
          widthFactor: 2,
          heightFactor: 2,
          alignment: Alignment(1, 0),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
      ListTile(
        title: Text('Stack'),
      ),
      Container(
        height: 200,
        width: double.infinity,
        color: Colors.red,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: -10,
              child: Text('top'),
            ),
            Positioned(
              left: 0,
              child: Text('left'),
            ),
            Positioned(
              bottom: 0,
              child: Text('bottom'),
            ),
            Positioned(
              right: 0,
              child: Text('right'),
            ),
            Text('测试111111111111111'),
          ],
        ),
      ),
      ListTile(
        title: Text('Flow'),
      ),
      Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.red,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.green,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.blue,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.yellow,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.brown,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.purple,
          ),
        ],
      ),
      ListTile(
        title: Text('Wrap'),
      ),
      Wrap(
        spacing: 8,
        runSpacing: 4,
        alignment: WrapAlignment.center,
        children: <Widget>[
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
            label: Text('Lafayette'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
            label: Text('Mulligan'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
            label: Text('Laurens'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
            label: Text('Laurens'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
            label: Text('Laurens'),
          ),
        ],
      ),
      ListTile(
        title: Text('Row'),
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          RaisedButton(
            child: Text('测试'),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text('测试'),
            onPressed: () {},
          ),
          Container(
            child: Text('容器'),
            width: 50,
            height: 150,
            color: Colors.limeAccent,
          )
        ],
      ),
      ListTile(
        title: Text('Column'),
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center, // 水品居中
        children: <Widget>[
          Text('测试1'),
          Text('测试22222222222'),
        ],
      ),
      ListTile(
        title: Text('ConstrainedBox'),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: 10),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.lightGreen,
              child: Column(
                children: <Widget>[
                  Text('测试1'),
                  Container(
                    height: 30.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                    child: Text(
                      '测试22222222222',
                      style:
                          TextStyle(color: Color.fromARGB(100, 255, 255, 255)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      ListTile(
        title: Text('Flex'),
      ),
      Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text('测试'),
          ),
          Expanded(
            flex: 5,
            child: Text(
              '测试',
            ),
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('布局'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: children,
          )
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
