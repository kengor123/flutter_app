import 'package:flutter/material.dart';
import 'package:flutter_app/network/networkController.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<UserPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  final NetworkController networkController = NetworkController();

  @override
  void initState() {
    username.text = ""; //innitail value of text field
    password.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User'),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.people),
                  )),
              TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  )),
              ElevatedButton(
                  onPressed: () {
                    networkController.userLogin(username.text, password.text);
                    print(username.text + "  " + password.text);
                  },
                  child: Text("login"))
            ],
          ),
        )));
  }
}
