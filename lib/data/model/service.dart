class Service {
  final int? id;
  final String name;
  final int unitCount;

  Service({
    this.id,
    required this.name,
    required this.unitCount,
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
