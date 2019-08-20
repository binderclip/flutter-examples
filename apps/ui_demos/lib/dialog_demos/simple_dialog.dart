import 'package:flutter/material.dart';

class SimpleDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'SimpleDialogPage';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _SimpleDialogPage(),
    );
  }
}

class _SimpleDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Show SimpleDialog'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
//              title: Text('title'),
              children: [
                SimpleDialogOption(
                  child: Text('foo'),
                  onPressed: () {
                    print('foo pressed');
                    Navigator.pop(context);
                  },
                ),
                SimpleDialogOption(
                  child: Text('bar'),
                  onPressed: () {
                    print('bar pressed');
                    Navigator.pop(context);
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
