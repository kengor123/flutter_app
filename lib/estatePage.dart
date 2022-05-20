import 'package:flutter/material.dart';

import 'data_model/property_model.dart';
import 'detailPage.dart';
import 'network/networkController.dart';

class EstatePage extends StatefulWidget {
  const EstatePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _EstateState createState() => _EstateState();
}

class _EstateState extends State<EstatePage> {
  final NetworkController networkController = NetworkController();

  @override
  Widget build(BuildContext context) {
    final propertyDataBase = NetworkController().createDb();

    return Scaffold(
      appBar: AppBar(
        title: Text('Estate'),
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
                          subtitle: Text(property.estate),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ListView(
                                    children: [ListTile()],
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
