import 'package:flutter/material.dart';
import 'package:flutter_app/estatePage.dart';
import 'package:flutter_app/homePage.dart';
import 'package:flutter_app/roomPage.dart';
import 'package:flutter_app/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(title: 'Home'),
    EstatePage(title: 'Estate'),
    RoomPage(title: 'Room'),
    LoginPage(title: 'User'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment),
            label: 'Estate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            label: 'Bedroom',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

