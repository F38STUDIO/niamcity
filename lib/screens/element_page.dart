import 'package:flutter/material.dart';
import '../models/type.dart';
import '../models/element.dart'; // Assurez-vous d'importer le modèle d'élément

class ElementsPage extends StatelessWidget {
  final LeType selectedType;

  ElementsPage({required this.selectedType});

  @override
  Widget build(BuildContext context) {
    // Supposons que vous ayez une liste d'éléments correspondant au type sélectionné.
    // Vous pouvez remplacer cette liste factice par votre propre liste d'éléments.
    List<MonElement> elements = [
      MonElement(
        id: "1",
        nom: "Élément 1",
        imgs: ["image1.jpg"],
        description: "Description de l'élément 1",
        type: "Type A",
        latitude: 0,
        longitude: 0,
        certifie: true,
      ),
      MonElement(
        id: "2",
        nom: "Élément 2",
        imgs: ["image2.jpg"],
        description: "Description de l'élément 2",
        type: "Type A",
        latitude: 0,
        longitude: 0,
        certifie: false,
      ),
      // Ajoutez d'autres éléments ici...
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedType.nom,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          final element = elements[index];
          return ListTile(
            title: Text(element.nom),
            // Affichez d'autres informations sur l'élément, par exemple, son image, sa description, etc.
            // Vous pouvez personnaliser l'apparence de chaque élément dans cette liste.
          );
        },
      ),
    );
  }
}
