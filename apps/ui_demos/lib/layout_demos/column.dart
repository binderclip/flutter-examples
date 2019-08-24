import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'ColumnPage';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Deliver features faster',
            style: TextStyle(
              backgroundColor: Colors.deepOrange,
            ),

          ),
          Text(
            'Craft beautiful UIs',
            style: TextStyle(
              backgroundColor: Colors.blue,
            ),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
