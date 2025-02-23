import '../../core/database_helper.dart';
import '../model/service.dart';

class ServiceRepository {
  final DatabaseHelper databaseHelper;

  ServiceRepository({required this.databaseHelper});

  Future<List<Service>> getAllServices() async {
    final db = await databaseHelper.database;
    final result = await db.query('services');
    return result.map((map) => Service.fromMap(map)).toList();
  }

  Future<int> updateService(Service service) async {
    final db = await databaseHelper.database;
    return await db.update(
      'services',
      service.toMap(),
      where: 'id = ?',
      whereArgs: [service.id],
    );
  }
}