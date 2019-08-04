import 'package:flutter/material.dart';

class TextFieldsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'TextFieldsPage';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text('== default =='),
            TextField(),
            Text('== multilines =='),
            TextField(
              keyboardType: TextInputType.multiline, // 似乎可以不用设置
              minLines: 3,
              maxLines: null, // null 的时候可以不停变大，不为 null 的时候只是展示有最大高度，但内部可以 scroll
            ),
            Text('== maxLength =='),
            TextField(maxLength: 5),
            Text('== with decoration =='),
            TextField(
              decoration: InputDecoration(
//                labelText: '<label>', // 输入前和 hint 冲突
                helperText: '[help msg...]',
                hintText: 'input something...',
//                errorText: 'something wrong', // 和 helper 冲突
//                prefixText: 'Input: ', // 输入前和 hint 在一起
                border: OutlineInputBorder(),
              ),
            ),
            Text('== no border decoration =='),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'input something',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
