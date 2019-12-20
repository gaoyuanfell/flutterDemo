import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  Map form = {
    'key1': false,
    'key2': 1,
    'key3': false,
    'key4': 0.0,
    'key5': null,
    'key6': null,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('表单'),
        ),
        body: ListView(children: <Widget>[
          TextField(
            onChanged: (value) {
              print(value);
            },
            decoration: InputDecoration(
              hintText: "请输入搜索文字",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            obscureText: true,
            onChanged: (value) {
              print(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '密码',
            ),
          ),
          Checkbox(
            value: form['key1'],
            onChanged: (bool value) {
              setState(() {
                form['key1'] = value;
              });
            },
          ),
          Row(
            children: <Widget>[
              Radio(
                groupValue: form['key2'],
                value: 1,
                onChanged: (value) {
                  setState(() {
                    form['key2'] = value;
                  });
                },
              ),
              Radio(
                groupValue: form['key2'],
                value: 2,
                onChanged: (value) {
                  setState(() {
                    form['key2'] = value;
                  });
                },
              ),
              Radio(
                groupValue: form['key2'],
                value: 3,
                onChanged: (value) {
                  setState(() {
                    form['key2'] = value;
                  });
                },
              )
            ],
          ),
          Container(
            child: Switch(
              value: form['key3'],
              onChanged: (bool value) {
                setState(() {
                  form['key3'] = value;
                });
              },
            ),
          ),
          Slider(
            value: form['key4'],
            max: 10,
            min: 0,
            divisions: 10,
            onChanged: (double value) {
              print(value);
              setState(() {
                form['key4'] = value;
              });
            },
          ),
          Text(form['key4'].toString()),
          MaterialButton(
            child: Text('选择日期${form['key5']}'),
            onPressed: () async {
              DateTime result = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2018),
                lastDate: DateTime(2030),
                builder: (BuildContext context, Widget child) {
                  return Theme(
                    data: ThemeData.dark(),
                    child: child,
                  );
                },
                locale: Locale('zh'),
              );
              print(result);
              TimeOfDay result2 = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(result2);
              print(
                  '${result.year}-${result.month}-${result.day} ${result2.hour}:${result2.minute}:00');
              setState(() {
                form['key5'] = '${result.year}-${result.month}-${result.day} ${result2.hour}:${result2.minute}:00';
              });
            },
          )
        ]));
  }
}
