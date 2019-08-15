import 'package:flutter/material.dart';

class Data {
  final String title;
  final String description;

  Data(this.title, this.description);
}

class ShowDataPage extends StatelessWidget {
  final Data data;

  ShowDataPage({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(data.description),
      ),
    );
  }
}
