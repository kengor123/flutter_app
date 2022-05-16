import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBase{

  Future<Database> createDb() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'rental_app_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE properties(id INTEGER PRIMARY KEY,'
              ' property_title TEXT,'
              ' image_URL TEXT,'
              'estate TEXT,'
              'bedrooms INTEGER,'
              'gross_area INTEGER,'
              ' expected_tenants INTEGER,'
              'rent INTEGER,'
              'h_Property TEXT'
              ')',
        );
      },
      version: 1,
    );

    return database;
  }


}