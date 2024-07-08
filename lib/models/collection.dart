class Collection {
  int? id;
  String title;
  int editions;
  int status;
  int read;
  String rarity;
  String imagePath;

  Collection({
    this.id,
    required this.title,
    required this.editions,
    required this.status,
    required this.read,
    required this.rarity,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'editions': editions,
      'status': status,
      'read': read,
      'rarity': rarity,
      'imagePath': imagePath,
    };

    if (id != null) {
      map['collectionsId'] = id;
    }

    return map;
  }

  factory Collection.fromMap(Map<String, dynamic> map) {
    return Collection(
      id: map['collectionsId'],
      title: map['title'],
      editions: map['editions'],
      status: map['status'],
      read: map['read'],
      rarity: map['rarity'],
      imagePath: map['imagePath'],
    );
  }

  @override
  String toString() {
    return "Collect(id: $id, title $title, editions: $editions, status: $status, read: $read, rarity: $rarity imagePath: $imagePath)";
  }
}