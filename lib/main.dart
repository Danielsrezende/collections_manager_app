import 'package:collections_manager_app/database/helpers/collections_helpers.dart';
import 'package:collections_manager_app/models/collection.dart';
import 'package:flutter/material.dart';
import 'package:collections_manager_app/app/app.dart';
import 'package:collections_manager_app/database/collections_manager_database.dart';

void main () async {
  final Collection collectionTest = Collection(title: 'title', editions: 4, status: 1, read: 1, rarity: 'Comun', imagePath: 'imagePath');
  final Collection collectionTestId = Collection(id: 1, title: 'title', editions: 4, status: 1, read: 1, rarity: 'Comun', imagePath: 'imagePath');


  WidgetsFlutterBinding.ensureInitialized();
  await CollectionsManagerDatabase().initialize();
  await CollectionsHelpers().insertCollection(collectionTest);
  await CollectionsHelpers().getCollections();
  await CollectionsHelpers().getCollectionById(collectionTestId.id);
  runApp(const CollectionsManagerApp());
}
