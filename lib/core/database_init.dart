import 'package:sqflite_common_ffi/sqflite_ffi.dart' show Database;

import 'database_helper.dart';

class DatabaseInit {
  final DatabaseHelper databaseHelper;

  DatabaseInit({required this.databaseHelper});

  Future<void> initializeDatabase() async {
    try {
      // Initialize the database
      final db = await databaseHelper.database;
      print('Database initialized successfully!');

      // Test inserting and querying data
      await _testDatabaseOperations(db);
    } catch (e) {
      print('Error initializing database: $e');
    }
  }

  Future<void> _testDatabaseOperations(Database db) async {
    // Test Item table
    final itemId = await db.insert('items', {
      'name': 'Test Item',
      'image_path': 'path/to/image',
    });
    print('Inserted item with ID: $itemId');

    // Test Meal table
    final mealId = await db.insert('meals', {
      'name': 'Test Meal',
      'has_items': 1,
      'has_appetizers': 0,
    });
    print('Inserted meal with ID: $mealId');

    // Test Meal-Items relationship
    await db.insert('meal_items', {
      'meal_id': mealId,
      'item_id': itemId,
    });
    print('Created meal-item relationship');

    // Test Service table
    final serviceId = await db.insert('services', {
      'name': 'Test Service',
      'unit_count': 5,
    });
    print('Inserted service with ID: $serviceId');

    // Test Booking table
    final bookingId = await db.insert('bookings', {
      'bride_name': 'Test Bride',
      'bridegroom_name': 'Test Groom',
      'bridegroom_number': '1234567890',
      'children_without_invite': 2,
      'guests_without_invite': 10,
      'meal_id': mealId,
      'manual_price': 5000,
      'total_guests': 100,
      'wedding_date': DateTime.now().toIso8601String(),
      'booking_time': DateTime.now().toIso8601String(),
    });
    print('Inserted booking with ID: $bookingId');

    // Test Booking-Services relationship
    await db.insert('booking_services', {
      'booking_id': bookingId,
      'service_id': serviceId,
    });
    print('Created booking-service relationship');

    // Query and print all tables
    final items = await db.query('items');
    final meals = await db.query('meals');
    final mealItems = await db.query('meal_items');
    final services = await db.query('services');
    final bookings = await db.query('bookings');
    final bookingServices = await db.query('booking_services');

    print('\nDatabase Contents:');
    print('Items: $items');
    print('Meals: $meals');
    print('Meal Items: $mealItems');
    print('Services: $services');
    print('Bookings: $bookings');
    print('Booking Services: $bookingServices');
  }
}
