import 'package:sqflite/sqflite.dart';
import 'package:collections_manager_app/database/migrations/collections_table.dart';

const String editionsTable = 'editionsTable';
const String editionIdColumn = 'editionId';
const String collectionIdColumn = 'collectionId';
const String titleColumn = 'editionTitle';
const String readColumn = 'editionRead';
const String rarityColumn = 'editionRarity';
const String editionNumberColumn = 'editionNumber';
const String imgColumn = 'imagePath';

Future<void> createEditionsTable(Database db) async {
  await db.execute(
    ''' 
      CREATE TABLE $editionsTable (
      $editionIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
      $collectionIdColumn INTEGER,
      $titleColumn TEXT,
      $readColumn NUMERIC,
      $rarityColumn TEXT,
      $editionNumberColumn INTEGER,
      $imgColumn TEXT,
      FOREIGN KEY ($collectionIdColumn) REFERENCES $collectionsTable ($collectionIdColumn))
    '''
  );
}