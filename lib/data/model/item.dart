class Item {
   int? id;
   String name;
   String imagePath;

  Item({
    this.id,
    required this.name,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'image_path': imagePath,
  };

  factory Item.fromMap(Map<String, dynamic> map) => Item(
    id: map['id'],
    name: map['name'],
    imagePath: map['image_path'],
  );
}