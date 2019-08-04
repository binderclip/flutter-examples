import 'package:flutter/material.dart';

class BasicListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'BasicListView';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('foo'),
            onTap: () {
              debugPrint('foo taped...');
            },
          ),
          ListTile(
            title: Text('bar'),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}
