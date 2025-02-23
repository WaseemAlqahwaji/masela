import '../../core/database_helper.dart';
import '../model/booking.dart';
import '../model/service.dart';
import 'meal_repo.dart';

class BookingRepository {
  final DatabaseHelper databaseHelper;

  BookingRepository({required this.databaseHelper});

  Future<int> createBooking(Booking booking) async {
    final db = await databaseHelper.database;
    return await db.transaction<int>((txn) async {
      final bookingId = await txn.insert('bookings', booking.toMap());

      for (final service in booking.services) {
        await txn.insert('booking_services', {
          'booking_id': bookingId,
          'service_id': service.id!,
        });
      }
      return bookingId;
    });
  }

  Future<List<Booking>> getAllBookings() async {
    final db = await databaseHelper.database;
    final bookings = await db.query('bookings');
    return await Future.wait(bookings.map((b) => _getBookingWithDetails(b)));
  }

  Future<Booking> _getBookingWithDetails(
      Map<String, dynamic> bookingMap) async {
    final db = await databaseHelper.database;

    final meal = await MealRepository(databaseHelper: databaseHelper)
        .getMealById(bookingMap['meal_id'] as int);

    final services = await db.rawQuery('''
      SELECT services.* 
      FROM booking_services
      INNER JOIN services ON booking_services.service_id = services.id
      WHERE booking_services.booking_id = ?
    ''', [bookingMap['id']]);

    return Booking(
      id: bookingMap['id'] as int?,
      brideName: bookingMap['bride_name'] as String,
      bridegroomName: bookingMap['bridegroom_name'] as String,
      bridegroomNumber: bookingMap['bridegroom_number'] as String,
      childrenWithoutInvite: bookingMap['children_without_invite'] as int,
      guestsWithoutInvite: bookingMap['guests_without_invite'] as int,
      meal: meal,
      services: services.map((s) => Service.fromMap(s)).toList(),
      manualPrice: bookingMap['manual_price'] as int,
      totalGuests: bookingMap['total_guests'] as int,
      weddingDate: DateTime.parse(bookingMap['wedding_date'] as String),
      bookingTime: DateTime.parse(bookingMap['booking_time'] as String),
    );
  }

  Future<int> deleteBooking(int id) async {
    final db = await databaseHelper.database;
    return await db.transaction<int>((txn) async {
      await txn
          .delete('booking_services', where: 'booking_id = ?', whereArgs: [id]);
      return await txn.delete('bookings', where: 'id = ?', whereArgs: [id]);
    });
  }
}
