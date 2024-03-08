import 'package:flutter/material.dart';
import 'package:niamcity/donnee_fixes/couleurs.dart';

import '../models/type_element.dart';

class TypesListPage extends StatelessWidget {
  final List<TypeElement> types;
  final String categorie;

  TypesListPage({
    required this.types,
    required this.categorie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          categorie,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: types.length,
        itemBuilder: (context, index) {
          final type = types[index];
          return GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 2.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                leading: const Icon(
                  Icons.category,
                  color: Couleurs.c,
                  size: 32.0,
                ),
                title: Text(
                  type.nom,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
