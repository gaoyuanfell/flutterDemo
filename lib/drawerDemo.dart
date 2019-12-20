import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('Tom'),
      accountEmail: new Text('tom@xxx.com'),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: NetworkImage(
          'http://imgsrc.baidu.com/forum/w=580/sign=b57187fbbf3eb13544c7b7b3961fa8cb/a826bd003af33a87dc2bab09c55c10385343b57a.jpg',
        ),
        radius: 35.0,
      ),
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          userHeader,
          Container(
            child: RaisedButton(
              child: Text('1'),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            leading: new CircleAvatar(
              child: new Icon(Icons.school),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            leading: new CircleAvatar(
              child: new Text('B2'),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 3'),
            leading: new CircleAvatar(
              child: new Icon(Icons.list),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
