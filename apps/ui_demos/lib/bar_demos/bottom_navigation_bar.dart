import 'package:flutter/material.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarPageState();
  }
}

class _BottomNavigationBarPageState extends State<StatefulWidget> {
  int _selectedIndex = 0;

  final title = 'BottomNavigationBarPage';
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOption = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
  ];

  _onItemTapped(int index) {
    debugPrint('_onItemTapped, index: $index');
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title + ' ($_selectedIndex)')),
      body: Center(
        child: _widgetOption[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
