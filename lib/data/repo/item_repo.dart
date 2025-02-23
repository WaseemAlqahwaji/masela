

import '../../core/database_helper.dart';
import '../model/item.dart';

class ItemRepository {
  final DatabaseHelper databaseHelper;

  ItemRepository({required this.databaseHelper});

  Future<int> createItem(Item item) async {
    final db = await databaseHelper.database;
    return await db.insert('items', item.toMap());
  }

  Future<List<Item>> getAllItems() async {
    final db = await databaseHelper.database;
    final result = await db.query('items');
    return result.map((map) => Item.fromMap(map)).toList();
  }

  Future<int> updateItem(Item item) async {
    final db = await databaseHelper.database;
    return await db.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(int id) async {
    final db = await databaseHelper.database;
    return await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}