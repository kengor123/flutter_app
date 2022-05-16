import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/data_model/property_model.dart';
import 'package:flutter_app/data_model/user_model.dart';

import 'dart:async';
import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

class NetworkController {

  Future<Database> createDb() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'rental_app_database2.db'),
      onCreate: (db, version) {
        //return db.execute('DROP TABLE IF EXISTS properties');
        return db.execute(
          'CREATE TABLE properties(id INTEGER PRIMARY KEY,'
              ' property_title TEXT,'
              ' image_URL TEXT,'
              'estate TEXT,'
              'bedrooms INTEGER,'
              'gross_area INTEGER,'
              'expected_tenants INTEGER,'
              'rent INTEGER,'
              'h_Property TEXT'
              ')',
        );
      },
      version: 1,
    );

    return database;
  }

  Future<List<Property>> fetchAllProperty() async {
    WidgetsFlutterBinding.ensureInitialized();

    final propertyDataBase = await createDb();

    const String url =
        'https://morning-plains-00409.herokuapp.com/property/json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Property> properties =
      body.map((dynamic item) => Property.fromJson(item)).toList();


      for (Property property in properties) {
        propertyDataBase.insert('properties', property.toMap());
      }

      final List<Map<String, dynamic>> maps =
      await propertyDataBase.query('properties');

      print(maps.toList());

      return List.generate(maps.length, (i) {
        return Property(
          id: maps[i]['id'],
          property_title: maps[i]['property_title'],
          image_URL: maps[i]['image_URL'],
          estate: maps[i]['estate'],
          bedrooms: maps[i]['bedrooms'],
          gross_area: maps[i]['gross_area'],
          expected_tenants: maps[i]['expected_tenants'],
          rent: maps[i]['rent'],
          h_Property: maps[i]['h_Property'],
        );
      });

      return properties;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load property');
    }
  }

  Future<void> userLogin(String username, String password) async {
    const String url = 'https://morning-plains-00409.herokuapp.com/user/login';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      Map<String, dynamic> userMap = jsonDecode(response.body.toString());

      var user = User.fromJson(userMap);
      print(user.username);
      User.fromJson(data);

      print(data);
    } else
    if (response.statusCode == 400) {} else if (response.statusCode == 401) {
      print("User not found or Wrong Password.");
    } else if (response.statusCode == 500) {} else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load property');
    }
  }
}
