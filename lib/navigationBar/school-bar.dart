import 'package:flutter/material.dart';

class SchoolBar extends StatefulWidget {
  @override
  _SchoolBarState createState() => _SchoolBarState();
}

class _SchoolBarState extends State<SchoolBar> {
  void _alertDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示信息'),
          content: Text('提示信息'),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
    print(result);
  }

  void _simpleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('请选择'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Option 1'),
              onPressed: () {
                Navigator.pop(context, 1);
              },
            ),
            SimpleDialogOption(
              child: Text('Option 2'),
              onPressed: () {
                Navigator.pop(context, 2);
              },
            ),
            SimpleDialogOption(
              child: Text('Option 3'),
              onPressed: () {
                Navigator.pop(context, 3);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 75,
                  child: FlatButton(
                    child: Text(
                      '关闭',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ),
                Container(
                  width: 75,
                  child: FlatButton(
                    child: Text(
                      '确认',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
    print(result);
  }

  _modelBottomSheet() async {
    var result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('分享'),
                onTap: () {
                  Navigator.pop(context, 1);
                },
              ),
              ListTile(
                title: Text('分享'),
                onTap: () {
                  Navigator.pop(context, 2);
                },
              ),
              ListTile(
                title: Text('分享'),
                onTap: () {
                  Navigator.pop(context, 3);
                },
              ),
            ],
          ),
        );
      },
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('alertDialog'),
          onPressed: _alertDialog,
        ),
        RaisedButton(
          child: Text('simpleDialog'),
          onPressed: _simpleDialog,
        ),
        RaisedButton(
          child: Text('modelBottomSheet'),
          onPressed: _modelBottomSheet,
        ),
      ],
    );
  }
}
