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
                  title: Text(
                    property.property_title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Image.network('${property.image_URL}'),
                ),
                ListTile(
                  title: Text("Estate: " + property.estate),
                ),
                ListTile(
                  title: Text("Rent: \$ ${property.rent}"),
                ),
                ListTile(
                  title: Text("Gross Area: ${property.gross_area}"),
                ),
                ListTile(
                  title: Text("Bedrooms: ${property.bedrooms}"),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {},
                  child: Text('move in'),
                ),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child: const Text('address'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
