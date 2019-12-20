import 'package:flutter/material.dart';

class ImageBar extends StatefulWidget {
  @override
  _ImageBarState createState() => _ImageBarState();
}

class _ImageBarState extends State<ImageBar> {
  List<Map> _data = List.generate(20, (index) {
    return {'index': index, 'isExpanded': false};
  });

  _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int panelIndex, bool isExpanded) {
        print(panelIndex);
        print(isExpanded);
        setState(() {
          _data[panelIndex]['isExpanded'] = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((item) {
        return ExpansionPanel(
          body: Text('111'),
          headerBuilder: (context, isExpanded) {
            return Text('123');
          },
          isExpanded: item['isExpanded'],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }
}