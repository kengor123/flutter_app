import 'package:flutter/material.dart';
import 'package:flutter_app/detailPage.dart';
import 'package:logger/logger.dart';
import 'package:flutter_app/network/networkController.dart';
import 'package:flutter_app/data_model/property_model.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  //late Future<List<Property>> futureProperties;

  final NetworkController networkController = NetworkController();

  final db = NetworkController().createDb();

  @override
  void initState() {
    super.initState();
    //futureProperties = fetchAllProperty();
    // futureProperties =
    //     networkController.fetchAllProperty();
  }

  @override
  Widget build(BuildContext context) {
    var logger = Logger();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: FutureBuilder(
          future: networkController.fetchAllProperty(),
          builder: (context, AsyncSnapshot<List<Property>> snapshot) {
            if (snapshot.hasData) {
              List<Property> properties = snapshot.data as List<Property>;
              //List<Property> properties = networkController.allProperty();
              return ListView(
                children: properties
                    .map((Property property) => ListTile(
                          title: Image.network(
                            '${property.image_URL}',
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                          subtitle: Text(
                            property.property_title +
                                "\n" +
                                property.estate +
                                ", \nRent: \$" +
                                property.rent.toString(),
                            textScaleFactor: 1.3,
                          ),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Detail(
                                        property: property,
                                      ))),
                        ))
                    .toList(),
                shrinkWrap: true,
              );
              // return Text(snapshot.data!.id.toString());
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
