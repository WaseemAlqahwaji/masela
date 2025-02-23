import 'dart:io';

import 'package:masela/core/file_util.dart';

import '../../core/database_helper.dart';
import '../model/item.dart';

class ItemRepository {
  Future<int> createItem(Item item) async {
    final db = await DatabaseHelper.instance.database;
    String p = await FileUtil.saveImage(image: File(item.imagePath));
    item.imagePath = p;
    return await db.insert('items', item.toMap());
  }

  Future<List<Item>> getAllItems() async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query('items');
    return result.map((map) => Item.fromMap(map)).toList();
  }

  Future<int> updateItem(Item item) async {
    final db = await DatabaseHelper.instance.database;

    String path = (await db.query(
      'items',
      where: 'id = ?',
      whereArgs: [item.id!],
    ))
        .first['image_path']
        .toString();
    if (path != item.imagePath) {
      await FileUtil.delete(
        path: path,
      );
      String p = await FileUtil.saveImage(image: File(item.imagePath));
      item.imagePath = p;
    }

    return await db.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> add(Item item) async {
    final db = await DatabaseHelper.instance.database;

    String p = await FileUtil.saveImage(image: File(item.imagePath));
    item.imagePath = p;

    return await db.insert(
      'items',
      item.toMap(),
    );
  }

  Future<int> deleteItem(int id) async {
    final db = await DatabaseHelper.instance.database;

    String path = (await db.query('items', where: 'id = ?', whereArgs: [id]))
        .first['image_path']
        .toString();
    await FileUtil.delete(path: path);
    return await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
