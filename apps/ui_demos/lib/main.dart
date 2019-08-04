import 'package:flutter/material.dart';
import 'package:ui_demos/list_view_demos/basic_list_view.dart';
import 'package:ui_demos/list_view_demos/long_list_view.dart';
import 'package:ui_demos/navigation_demos/simple_nav_back.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final title = 'Flutter UI Demos';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: RoutePage(),
    );
  }
}

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Flutter UI Demos';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('=== List ===')),
          ListTile(
            title: Text('BasicListView'),
            onTap: () {
              debugPrint('BasicListView taped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasicListViewPage()),
              );
            },
          ),
          ListTile(
            title: Text('LongListView'),
            onTap: () {
              debugPrint('LongListView taped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LongListViewPage()),
              );
            },
          ),
          ListTile(title: Text('=== Navigation ===')),
          ListTile(
            title: Text('SimpleNavbackPage'),
            onTap: () {
              debugPrint('SimpleNavbackPage taped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SimpleNavBackPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
