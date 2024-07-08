import 'package:collections_manager_app/database/migrations/editions_table.dart';
import 'package:collections_manager_app/database/collections_manager_database.dart';
import 'package:collections_manager_app/models/edition.dart';
import 'package:logging/logging.dart';

class EditionsHelpers {
  final Logger _logger = Logger('EditionsHelper');

  Future<void> insertEdition(Edition edition) async {
    try {
      final db = await CollectionsManagerDatabase().db;
      await db.insert(editionsTable, edition.toMap());
      _logger.info('Edition saved: ${edition.id}');
    } catch (e, stacktrace) {
      _logger.severe('Failed to save edition:', e, stacktrace);
      rethrow;
    }
  }

  Future<List<Edition>> getEditions() async {
    try {
      final db = await CollectionsManagerDatabase().db;
      final List<Map<String, dynamic>> maps = await db.query(editionsTable);
      final editions = List.generate(maps.length, (i) {
        return Edition.fromMap(maps[i]);
      });
      _logger.info('Editions searched: $editions');
      return editions;
    } catch (e, stacktrace) {
      _logger.severe('Failed to search edition:', e, stacktrace);
      rethrow;
    }
  }

  Future<Edition?> getEditionById(int editionId) async {
    try {
      final db = await CollectionsManagerDatabase().db;
      final List<Map<String, dynamic>> maps = await db.query(
        editionsTable,
        where: '$editionIdColumn = ?',
        whereArgs: [editionId],
      );
      if (maps.isNotEmpty) {
        final edition = Edition.fromMap(maps.first);
        return edition;
      } else {
        return null;
      }
    } catch (e, stacktrace) {
      _logger.severe('Failed to obtain edition by ID:', e, stacktrace);
      rethrow;
    }
  }

  Future<void> updateEdition(Edition edition) async {
    try {
      final db = await CollectionsManagerDatabase().db;
      await db.update(
        editionsTable,
        edition.toMap(),
        where: '$editionIdColumn = ?',
        whereArgs: [edition.id],
      );
      _logger.info('Updated edition: ${edition.id}');
    } catch (e, stacktrace) {
      _logger.severe('Failed to update edition:', e, stacktrace);
      rethrow;
    }
  }

  Future<void> deleteEdition(int id) async {
    try {
      final db = await CollectionsManagerDatabase().db;
      await db.delete(
        editionsTable,
        where: '$editionIdColumn = ?',
        whereArgs: [id]
      );
      _logger.info('edition deleted: $id');
    } catch (e, stacktrace) {
      _logger.severe('Failed to delete edition:', e, stacktrace);
      rethrow;
    }
  }
}
