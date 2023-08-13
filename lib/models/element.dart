class Element {
  String id;
  String nom;
  List<String> imgs;
  String description;
  int latitude;
  int longitude;
  bool certifie;
  String? prix;
  int? contact;
  int? quantite;

  Element({
    required this.id,
    required this.nom,
    required this.imgs,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.certifie,
  });
}
