import 'package:flutter/material.dart';

class SimpleNavBackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'SimpleNavBackPage';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
