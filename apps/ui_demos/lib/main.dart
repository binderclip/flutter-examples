import 'package:flutter/material.dart';
import 'package:ui_demos/navigation_demos/show_data_page.dart';
import 'dialog_demos/alert_dialog.dart';
import 'app_bar_demos/app_bar_button.dart';
import 'list_view_demos/basic_list_view.dart';
import 'list_view_demos/dynamic_list_view.dart';
import 'list_view_demos/future_builder_list_view.dart';
import 'list_view_demos/long_list_view.dart';
import 'navigation_demos/simple_nav_back.dart';
import 'snack_bar_demos/snack_bar.dart';
import 'text_field_demos/read_text_field_value.dart';
import 'text_field_demos/text_fields.dart';

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
              debugPrint('BasicListView tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasicListViewPage()),
              );
            },
          ),
          ListTile(
            title: Text('LongListView'),
            onTap: () {
              debugPrint('LongListView tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LongListViewPage()),
              );
            },
          ),
          ListTile(
            title: Text('DynamicListView'),
            onTap: () {
              debugPrint('DynamicListView tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DynamicListView()),
              );
            },
          ),
          ListTile(
            title: Text('FutureBuilderListView'),
            onTap: () {
              debugPrint('FutureBuilderListView tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FutureBuilderListView()),
              );
            },
          ),
          ListTile(title: Text('=== Navigation ===')),
          ListTile(
            title: Text('SimpleNavbackPage'),
            onTap: () {
              debugPrint('SimpleNavbackPage tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SimpleNavBackPage()),
              );
            },
          ),
          ListTile(
            title: Text('ShowDataPage'),
            onTap: () {
              debugPrint('ShowDataPage tapped');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowDataPage(data: Data('Hello', 'world!!!')),
                ),
              );
            },
          ),
          ListTile(title: Text('=== TextField ===')),
          ListTile(
            title: Text('ReadTextFieldValuePage'),
            onTap: () {
              debugPrint('ReadTextFieldValuePage tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReadTextFieldValuePage()),
              );
            },
          ),
          ListTile(
            title: Text('TextFieldsPage'),
            onTap: () {
              debugPrint('TextFieldsPage tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TextFieldsPage()),
              );
            },
          ),
          ListTile(title: Text('=== Bar ===')),
          ListTile(
            title: Text('AppBarButtonPage'),
            onTap: () {
              debugPrint('AppBarButtonPage tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppBarButtonPage()),
              );
            },
          ),
          ListTile(
            title: Text('SnackBarPage'),
            onTap: () {
              debugPrint('SnackBarPage tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SnackBarPage()),
              );
            },
          ),
          ListTile(title: Text('=== Dialog ===')),
          ListTile(
            title: Text('AlertDialogPage'),
            onTap: () {
              debugPrint('AlertDialogPage tapped');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlertDialogPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
