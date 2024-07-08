import 'package:collections_manager_app/database/migrations/collections_table.dart';
import 'package:collections_manager_app/database/collections_manager_database.dart';
import 'package:collections_manager_app/models/collection.dart';
import 'package:logging/logging.dart';

class CollectionsHelpers {
  final Logger _logger = Logger('CollectionHelper');

  Future<void> insertCollection(Collection collection) async {
    try {
      final db = await CollectionsManagerDatabase().db;
      await db.insert(collectionsTable, collection.toMap());
      return _logger.info('Collection saved: ${collection.id}');
    } catch (e, stacktrace) {
      _logger.severe('Failed to save collection:', e, stacktrace);
      rethrow;
    }
  }

  Future<List<Collection>> getCollections() async {
    try {
      final db = await CollectionsManagerDatabase().db;
      final List<Map<String, dynamic>> maps = await db.query(collectionsTable);
      final collections = List.generate(maps.length, (i) {
        return Collection.fromMap(maps[i]);
      });
      return collections;
    } catch (e, stacktrace) {
      _logger.severe('Failed to get collections:', e, stacktrace);
      rethrow;
    }
  }

  Future<Collection?> getCollectionById(int? collectionId) async {
    try {
      final db = await CollectionsManagerDatabase().db;
      final List<Map<String, dynamic>> maps = await db.query(
        collectionsTable,
        where: '$collectionIdColumn = ?',
        whereArgs: [collectionId]);
      if (maps.isNotEmpty) {
        final collection = Collection.fromMap(maps.first);
        return collection;
      } else {
        return null;
      }
    } catch (e, stacktrace) {
      _logger.severe('Failed to get collection by ID:', e, stacktrace);
      rethrow;
    }
  }

  Future<void> updateCollection(Collection collection) async {
    try {
      final db = await CollectionsManagerDatabase().db;
      await db.update(
          collectionsTable,
          collection.toMap(),
          where: '$collectionIdColumn = ?',
          whereArgs: [collection.id]
      );
      return _logger.info('Collection updated: ${collection.id}');
    } catch (e, stacktrace) {
      _logger.severe('Failed to update collection:', e, stacktrace);
      rethrow;
    }
  }

  Future<void> deleteCollection(int id) async {
    try {
      final db = await CollectionsManagerDatabase().db;
      await db.delete(
          collectionsTable, where: '$collectionIdColumn = ?', whereArgs: [id]);
      return _logger.info('Collection deleted: $id');
    } catch (e, stacktrace) {
      _logger.severe('Failed to delete collection:', e, stacktrace);
      rethrow;
    }
  }
}
