import 'package:flutter/material.dart';

class AlertDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'AlertDialogPage';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _AlertDialogPage(),
    );
  }
}

class _AlertDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Show AlertDialog'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Rewind and remember'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('You will never be satisfied.'),
                    Text('You\’re like me. I’m never satisfied.'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Regret'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    debugPrint('regret button touched');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}