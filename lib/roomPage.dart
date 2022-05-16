import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {

  const RoomPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<RoomPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room'),
      ),
    );
  }
}