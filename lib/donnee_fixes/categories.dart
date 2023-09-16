import 'package:flutter/material.dart';
import 'package:niamcity/donnee_fixes/types.dart';
import 'package:niamcity/models/categorie.dart';

List<Categorie> categories = [
  Categorie(
    id: "001",
    nom: "Santé",
    icon: Icons.favorite,
    img: "assets/001.jpeg",
    types: typesSante,
  ),
  Categorie(
    id: "002",
    nom: "Education",
    icon: Icons.school,
    img: "",
    types: typesEducation,
  ),
  Categorie(
    id: "003",
    nom: "logement",
    icon: Icons.home,
    img: "",
    types: typesLogement,
  ),
  Categorie(
    id: "004",
    nom: "Transport",
    icon: Icons.directions_bus,
    img: "",
    types: typesTransport,
  ),
  Categorie(
    id: "005",
    nom: "commerce",
    icon: Icons.shopping_cart,
    img: "",
    types: typesCommerce,
  ),
  Categorie(
    id: "006",
    nom: "Tourisme",
    icon: Icons.airplanemode_active,
    img: "",
    types: typesTourisme,
  ),
  Categorie(
    id: "007",
    nom: "Loisirs",
    icon: Icons.sports_soccer,
    img: "",
    types: typesLoisirs,
  ),
  Categorie(
    id: "008",
    nom: "Divers",
    icon: Icons.more_horiz,
    img: "",
    types: typesDivers,
  ),
];
