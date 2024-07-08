class Edition {
  int? id;
  int collectionId;
  String title;
  int read;
  String rarity;
  String editionNumber;
  String imagePath;

  Edition({
    this.id,
    required this.collectionId,
    required this.title,
    required this.read,
    required this.rarity,
    required this.editionNumber,
    required this.imagePath
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'collectionId': collectionId,
      'editionTitle': title,
      'editionRead': read,
      'editionRarity': rarity,
      'editionNumber': editionNumber,
      'imagePath': imagePath
    };
    if (id != null) {
      map['editionId'] = id;
    }

    return map;
  }

  factory Edition.fromMap(Map<String, dynamic> map) {
    return Edition(
      id: map['editionId'],
      collectionId: map['collectionId'],
      title: map['editionTitle'],
      read: map['editionRead'],
      rarity: map['editionRarity'],
      editionNumber: map['editionNumber'],
      imagePath: map['imagePath']
    );
  }
}
