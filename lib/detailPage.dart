import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_model/property_model.dart';

class Detail extends StatelessWidget {
  final Property property;

  const Detail({required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.property_title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Image.network('${property.image_URL}'),
                ),
                ListTile(
                  title: Text(
                    property.property_title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 2,
                  ),
                ),
                ListTile(
                  title: Text(
                      "Estate: ${property.estate},  Rent: \$${property.rent}"),
                ),
                ListTile(
                  title: Text(
                      "Area: ${property.gross_area},  Bedrooms: ${property.bedrooms}"),
                ),
                ListTile(
                  title: Text("Tenants : ${property.expected_tenants}"),
                ),
                Container(
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {},
                        child: Text('move in',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {},
                          child: const Text('address',
                              style: TextStyle(color: Colors.white)))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  alignment: Alignment.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
