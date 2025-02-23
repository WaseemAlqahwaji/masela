import '../../core/database_helper.dart';
import '../model/item.dart';
import '../model/meal.dart';

class MealRepository {
  final DatabaseHelper databaseHelper;

  MealRepository({required this.databaseHelper});

  Future<int> createMeal(Meal meal) async {
    final db = await databaseHelper.database;
    return await db.transaction<int>((txn) async {
      final mealId = await txn.insert('meals', meal.toMap());

      for (final item in meal.items) {
        await txn.insert('meal_items', {
          'meal_id': mealId,
          'item_id': item.id!,
        });
      }
      return mealId;
    });
  }

  Future<List<Meal>> getAllMeals() async {
    final db = await databaseHelper.database;
    final meals = await db.query('meals');
    return await Future.wait(meals.map((m) => getMealWithItems(m)));
  }

  Future<Meal> getMealWithItems(Map<String, dynamic> mealMap) async {
    final db = await databaseHelper.database;

    // Use raw query for JOIN operation
    final items = await db.rawQuery('''
    SELECT items.* 
    FROM meal_items
    INNER JOIN items ON meal_items.item_id = items.id
    WHERE meal_items.meal_id = ?
  ''', [mealMap['id']]);

    return Meal.fromMap(
      mealMap,
      items.map((itemMap) => Item.fromMap(itemMap)).toList(),
    );
  }

  Future<Meal> getMealById(int id) async {
    final db = await databaseHelper.database;
    final mealMap = (await db.query(
      'meals',
      where: 'id = ?',
      whereArgs: [id],
    ))
        .first;
    return getMealWithItems(mealMap);
  }

  Future<int> updateMeal(Meal meal) async {
    final db = await databaseHelper.database;
    return await db.transaction<int>((txn) async {
      await txn
          .delete('meal_items', where: 'meal_id = ?', whereArgs: [meal.id]);

      for (final item in meal.items) {
        await txn.insert('meal_items', {
          'meal_id': meal.id,
          'item_id': item.id!,
        });
      }
      return await txn.update(
        'meals',
        meal.toMap(),
        where: 'id = ?',
        whereArgs: [meal.id],
      );
    });
  }

  Future<int> deleteMeal(int id) async {
    final db = await databaseHelper.database;
    return await db.transaction<int>((txn) async {
      await txn.delete('meal_items', where: 'meal_id = ?', whereArgs: [id]);
      return await txn.delete('meals', where: 'id = ?', whereArgs: [id]);
    });
  }
}
