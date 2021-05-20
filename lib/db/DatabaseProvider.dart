import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseProvider {
  static final TABLE_NAME = 'dog';
  static final COL_ID = 'id';
  static final APPLICATION_NAME = 'name';
  static final IS_KENNEL = 'is_kennel';
  static final DOG_NAME = 'dog_name';
  static final GENDER = 'gender';
  static final BREED = 'breed';
  static final PRIMARY_COLOR = 'primary_color';
  static final SECONDARY_COLOR = 'secondary_color';
  static final APPLICANT_NAME = 'applicant_name';
  static final APPLICANT_ADDRESS = 'applicant_address';
  static final OWNER_NAME = 'owner_name';
  static final OWNER_ADDRESS = 'owner_address';
  static final AGE = 'age';
  static final LICENSE_FEE = 'license_fee';

  DatabaseProvider._privateConstructor();

  static DatabaseProvider instance = DatabaseProvider._privateConstructor();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initiateDatabase();
    return _database;
  }

  initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'database.db');
    return await openDatabase(path, version: 1, onCreate: onCreateDatabase);
  }

  onCreateDatabase(Database db, int version) async {
    db.execute(
        'create table $TABLE_NAME ($COL_ID INTEGER PRIMARY KEY, $APPLICATION_NAME TEXT NOT NULL, $IS_KENNEL TEXT, $DOG_NAME TEXT, $GENDER TEXT, $BREED TEXT, $PRIMARY_COLOR TEXT, $SECONDARY_COLOR TEXT, $APPLICANT_NAME TEXT, $APPLICANT_ADDRESS TEXT, $OWNER_NAME TEXT, $OWNER_ADDRESS TEXT, $AGE INTEGER, $LICENSE_FEE INTEGER)');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = await db.insert(TABLE_NAME, row);
    return id;
  }
}
