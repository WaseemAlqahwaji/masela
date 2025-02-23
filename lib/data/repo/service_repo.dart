import '../../core/database_helper.dart';
import '../model/service.dart';

class ServiceRepository {
  Future<List<Service>> getAllServices() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('services');
    return result.map((map) => Service.fromMap(map)).toList();
  }

  Future<int> updateService(Service service) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update(
      'services',
      service.toMap(),
      where: 'id = ?',
      whereArgs: [service.id],
    );
  }

  Future<int> add(Service service) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(
      'services',
      service.toMap(),
    );
  }

  Future<void> delete(int service) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('services', where: 'id = ?', whereArgs: [
      service,
    ]);
  }
}
