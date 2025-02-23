import 'item.dart';

class Meal {
  final int? id;
  final String name;
  final bool hasItems;
  final bool hasAppetizers;
  final List<Item> items;

  Meal({
    this.id,
    required this.name,
    required this.hasItems,
    required this.hasAppetizers,
    required this.items,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'has_items': hasItems ? 1 : 0,
    'has_appetizers': hasAppetizers ? 1 : 0,
  };

  factory Meal.fromMap(Map<String, dynamic> map, List<Item> items) => Meal(
    id: map['id'],
    name: map['name'],
    hasItems: map['has_items'] == 1,
    hasAppetizers: map['has_appetizers'] == 1,
    items: items,
  );
}