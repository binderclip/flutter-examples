import 'package:flutter/material.dart';

class LongListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'LongListView';
    final items = List<String>.generate(10000, (i) => "Item $i");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
            onTap: () {
              debugPrint('tile tapped, i: $index'); // 这样性能可能不太好，每个都要创建一个回调函数
            },
          );
        },
      ),
    );
  }
}
