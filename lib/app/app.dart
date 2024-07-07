import 'package:collections_manager_app/ui/collections_home_page.dart';
import 'package:flutter/material.dart';

class CollectionsManagerApp extends StatelessWidget {
  const CollectionsManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CollectionsHomePage(),
    );
  }
}