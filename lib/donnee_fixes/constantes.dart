import 'package:flutter/material.dart';

import '../models/element.dart';
import 'categories.dart';

// Dans cette partie on peut stocker tout ce qui constante dont notre application peut avoir besoin

final List<Map<String, dynamic>> listCategorie = [
  {'name': 'Education', 'icon': Icons.school},
  {'name': 'Sante', 'icon': Icons.favorite},
  {'name': 'Commerce', 'icon': Icons.shopping_cart},
  {'name': 'Tourisme', 'icon': Icons.airplanemode_active},
  {'name': 'Transport', 'icon': Icons.directions_bus},
  {'name': 'Logement', 'icon': Icons.home},
  {'name': 'Loisirs', 'icon': Icons.sports_soccer},
  {'name': 'Divers', 'icon': Icons.more_horiz},
];

List<MonElement> elements01 = [
  MonElement(
      id: "1234",
      nom: "CSP HIKIMA",
      imgs: [],
      description:
          "Une école de reference. Une des plus prestigieuse dans tout le pays.",
      type: categories[1].types[1],
      latitude: 14.328933086126652,
      longitude: 8.322645718749992,
      certifie: true),
      MonElement(
      id: "1234",
      nom: "CSP my Talla ",
      imgs: [],
      description:
          "Une école de reference. Une des plus prestigieuse dans tout le pays.",
      type: categories[1].types[1],
      latitude: 14.724739075233233,
      longitude: 5.8836808749999925,
      certifie: true),
      MonElement(
      id: "1234",
      nom: "CSP saloumi",
      imgs: [],
      description:
          "Une école de reference. Une des plus prestigieuse dans tout le pays.",
      type: categories[1].types[1],
      latitude: 16.429177284601234,
      longitude: 8.515980139691557,
      certifie: true),
];
