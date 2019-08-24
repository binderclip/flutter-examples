import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'TextPage';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Hello',
            style: TextStyle(
              backgroundColor: Colors.deepOrange,
            ),
          ),
          Text(
            'World!',
            style: TextStyle(
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}