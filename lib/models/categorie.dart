import 'package:flutter/material.dart';
import 'package:niamcity/models/type.dart';

class Categorie {
  String id;
  String nom;
  IconData icon;
  String img;
  List<LeType> types;

  Categorie({
    required this.id,
    required this.nom,
    required this.icon,
    required this.img,
    required this.types,
  });
}
