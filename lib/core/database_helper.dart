import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  static String? _databasePath;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    sqfliteFfiInit();
    final String userPath = Platform.environment['USERPROFILE']!;
    final dbPath = '$userPath/appData/local/masela/db';
    // final documentsDirectory = await getApplicationDocumentsDirectory();
    _databasePath = join(dbPath, 'wedding_hall.db');
    return await databaseFactoryFfi.openDatabase(
      _databasePath!,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: _createDB,
      ),
    );
  }

  static Future<void> deleteDatabase() async {
    if (_database != null) {
      await _database!.close();
    }
    if (_databasePath != null) {
      await databaseFactoryFfi.deleteDatabase(_databasePath!);
    }
    _database = null;
    _databasePath = null;
    print('Database deleted successfully');
  }

  Future<void> _createDB(Database db, int version) async {
    // Tables from previous schema

    await db.execute('''
      CREATE TABLE items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image_path TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        has_items INTEGER NOT NULL DEFAULT 0,
        has_appetizers INTEGER NOT NULL DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE meal_items (
        meal_id INTEGER NOT NULL,
        item_id INTEGER NOT NULL,
        FOREIGN KEY(meal_id) REFERENCES meals(id),
        FOREIGN KEY(item_id) REFERENCES items(id),
        PRIMARY KEY(meal_id, item_id)
      )
    ''');

    // Services
    await db.execute('''
      CREATE TABLE services (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        unit_count INTEGER NOT NULL CHECK(unit_count >= 0)
      )
    ''');

    await db.execute('''
      CREATE TABLE bookings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bride_name TEXT NOT NULL,
        bridegroom_name TEXT NOT NULL,
        bridegroom_number TEXT NOT NULL,
        children_without_invite INTEGER NOT NULL DEFAULT 0,
        guests_without_invite INTEGER NOT NULL DEFAULT 0,
        meal_id INTEGER NOT NULL,
        manual_price INTEGER NOT NULL CHECK(manual_price >= 0),
        total_guests INTEGER NOT NULL CHECK(total_guests >= 0),
        wedding_date TEXT NOT NULL,
        booking_time TEXT NOT NULL,
        FOREIGN KEY(meal_id) REFERENCES meals(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE booking_services (
        booking_id INTEGER NOT NULL,
        service_id INTEGER NOT NULL,
        FOREIGN KEY(booking_id) REFERENCES bookings(id),
        FOREIGN KEY(service_id) REFERENCES services(id),
        PRIMARY KEY(booking_id, service_id)
      )
    ''');

    await db.insert('services', {
      'name': 'Mobile Covers',
      'unit_count': 0 // Required field added
    });
  }

  Future<void> close() async {
    await _database?.close();
  }
}
