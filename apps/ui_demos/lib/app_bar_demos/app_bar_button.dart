import 'package:flutter/material.dart';

class AppBarButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'AppBarButtonPage';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            tooltip: 'save it',
            onPressed: () {
              debugPrint('save button pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.call),
            tooltip: 'call',
            onPressed: () {
              debugPrint('call button pressed');
            },
          ),
        ],
      ),
      body: Placeholder(),
    );
  }
}