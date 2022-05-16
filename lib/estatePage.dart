import 'package:flutter/material.dart';

class EstatePage extends StatefulWidget {

  const EstatePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _EstateState createState() => _EstateState();
}

class _EstateState extends State<EstatePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estate'),
      ),
    );
  }
}
