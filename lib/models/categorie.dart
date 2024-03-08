import 'package:flutter/material.dart';
import 'package:niamcity/models/type_element.dart';

class Categorie {
  String id;
  String nom;
  IconData icon;
  String img;
  List<TypeElement> types;

  Categorie({
    required this.id,
    required this.nom,
    required this.icon,
    required this.img,
    required this.types,
  });
}
