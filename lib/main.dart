import 'package:flutter/material.dart';
import 'package:collections_manager_app/app/app.dart';
import 'package:collections_manager_app/database/database.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  bool databaseInitialized = await CollectionsMangerDatabase().initialize();

  if (!databaseInitialized) {
    return;
  } else {
    print('Banco de dados iniciado com sucesso!');
  }

  runApp(const CollectionsManagerApp());
}
