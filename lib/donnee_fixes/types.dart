import 'package:flutter/material.dart';
import 'package:niamcity/models/type.dart';

// Cette liste contient toutes les differentes categories d'Elementes disponibles sur l'application (clinique, maternite, etc...)
// Lorsque vous ajoutez un nouveau type, faites attention au 'id' que vous choisisez. Il sera utilisé pour trier les 'Element'(s).
List<Type> types = [
  Type(
    id: "001",
    nom: "clinique",
    categorie: "001",
    icon: Icons.heart_broken,
  ),
];
