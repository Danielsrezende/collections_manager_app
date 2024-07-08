import 'package:sqflite/sqflite.dart';

const String collectionsTable = "collectionsTable";
const String collectionIdColumn = 'collectionsId';
const String titleColumn = "title";
const String editionsColumn = 'editions';
const String statusColumn = 'status';
const String readColumn = 'read';
const String rarityColumn = 'rarity';
const String imgColumn = "imagePath";

Future<void> createCollectionsTable(Database db) async {
  await db.execute(
    '''
      CREATE TABLE $collectionsTable (
      $collectionIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
      $titleColumn TEXT,
      $editionsColumn INTEGER,
      $statusColumn NUMERIC,
      $readColumn NUMERIC,
      $rarityColumn TEXT,
      $imgColumn TEXT)
    '''
  );
}
