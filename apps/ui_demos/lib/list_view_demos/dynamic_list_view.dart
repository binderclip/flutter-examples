import 'package:flutter/material.dart';

class DynamicListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DynamicListViewState();
  }
}

class _DynamicListViewState extends State<DynamicListView> {
  List<String> litems = ["hello"];
  final eCtrl = TextEditingController();
  final title = 'DynamicListView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: <Widget>[
          TextField(
            controller: eCtrl,
            onSubmitted: (text) {
              litems.add(text);
              eCtrl.clear();
              setState(() {});
            },
          ),
          Expanded(child: ListView.builder(
            itemCount: litems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(litems[index]),
                onTap: () {
                  debugPrint('tile tapped, i: $index'); // 这样性能可能不太好，每个都要创建一个回调函数
                },
                onLongPress: () {
                  Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text(index.toString())));
                },
              );
            },
          ),),
        ],
      ),
    );
  }
}
