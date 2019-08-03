import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

int mtimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

Future printLocalPath() async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    debugPrint('>>> dir: $directory');
  } catch (e) {
    debugPrint('error: $e');
  }
}

createDirDemo() async {
  final dirname = await _localPath + '/files';
  new Directory(dirname).create(recursive: true).then((Directory directory) {
    debugPrint('>>> create dir succeed: ${directory.path}');
  });
  // TODO: 考虑创建的失败和后续操作的先后顺序
}

createFileTest() async {
  final mts = mtimestamp().toString();
  final filename = await _localPath + '/files/' + mts + '.md';
  new File(filename).writeAsString('mts: $mts').then((File file) {
    file.readAsString().then((String contents) {
      debugPrint('>>> create file succeed: $filename');
    });
  });
}

Future<String> readFiles() async {
  final dirname = await _localPath + '/files';
  final dir = Directory(dirname);
  var fileNameAndDatas = "";
  final entities = dir.listSync(recursive: false, followLinks: false);
  for (final entity in entities) {
    debugPrint('>>> read file entity: $entity');
    if (entity is! File) {
      continue;
    }
    final pathSplits = entity.path.split('/');
    final filename = pathSplits[pathSplits.length - 1];
    final filedata = (entity as File).readAsStringSync();
    fileNameAndDatas += '<$filename> $filedata\n';
  }
  debugPrint('>>> read files succeed: $fileNameAndDatas');
  return fileNameAndDatas;
}

main() {
  debugPrint(">>> ok");
  printLocalPath();
  debugPrint(">>> done");
  createDirDemo();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0;
  var _s = '';

  void _incrementCounter() {
    createFileTest();
    readFiles().then((String s) {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _s = s;
      });
    });
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter\n$_s',
              style: Theme.of(context).textTheme.overline,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
