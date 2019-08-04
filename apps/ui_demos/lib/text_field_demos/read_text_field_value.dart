import 'package:flutter/material.dart';

class ReadTextFieldValuePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReadTextFieldValuePageState();
  }
}

class _ReadTextFieldValuePageState extends State<ReadTextFieldValuePage> {
  final myTextEditingController = TextEditingController();

  @override
  void dispose() {
    myTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = "ReadTextFieldValuePage";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myTextEditingController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('float button pressed');
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myTextEditingController.text),
              );
            }
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}