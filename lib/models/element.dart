import 'type.dart';

class MonElement {
  String id;
  String nom;
  List<String> imgs;
  String description;
  LeType type;
  double latitude;
  double longitude;
  bool certifie;
  String? prix;
  int? contact;
  int? quantite;

  MonElement({
    required this.id,
    required this.nom,
    required this.imgs,
    required this.description,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.certifie,
  });
}
