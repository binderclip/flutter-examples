import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'SnackBarPage';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _SnackBarPage(),
    );
  }
}

class _SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Show SnackBar'),
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}