import 'package:flutter/material.dart';

class CollectionsHomePage extends StatefulWidget {
  const CollectionsHomePage({super.key});

  @override
  State<CollectionsHomePage> createState() => _CollectionsHomePageState();
}

class _CollectionsHomePageState extends State<CollectionsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MInhas Coleções'),
      ),
    );
  }
}
