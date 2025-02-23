class Service {
   int? id;
   String name;
   int unitCount;

  Service({
    this.id,
    required this.name,
    this.unitCount = 0,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'unit_count': unitCount,
      };

  factory Service.fromMap(Map<String, dynamic> map) => Service(
        id: map['id'],
        name: map['name'],
        unitCount: map['unit_count'],
      );
}
