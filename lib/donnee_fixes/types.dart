import 'package:niamcity/models/type.dart';

// Cette liste contient toutes les differentes categories d'Elementes disponibles sur l'application (clinique, maternite, etc...)
// Lorsque vous ajoutez un nouveau type, faites attention au 'id' que vous choisisez. Il sera utilisé pour trier les 'Element'(s).

List<LeType> typesSante = [
  LeType(
    id: "001",
    nom: "clinique",
    categorie: "001",
  ),
  LeType(
    id: "002",
    nom: "HYGIENE",
    categorie: "001",
  ),
  LeType(
    id: "003",
    nom: "PHARMACIES",
    categorie: "001",
  ),
  LeType(
    id: "004",
    nom: "HOPITAUX",
    categorie: "001",
  ),
  LeType(
    id: "005",
    nom: "MERE ET ENFANT",
    categorie: "001",
  ),
  LeType(
    id: "006",
    nom: "MATERNITES",
    categorie: "001",
  ),
];

List<LeType> typesEducation = [
  LeType(
    id: "007",
    nom: "Etudes Sup ",
    categorie: "002",
  ),
  LeType(
    id: "008",
    nom: " ECOLES PRIVES",
    categorie: "002",
  ),
  LeType(
    id: "009",
    nom: "ECOLES PUBLIQUES",
    categorie: "002",
  ),
  LeType(
    id: "010",
    nom: "Centres de formations",
    categorie: "002",
  ),
  LeType(
    id: "011",
    nom: "COURS",
    categorie: "002",
  ),
  LeType(
    id: "012",
    nom: "DOCUMENTS",
    categorie: "002",
  ),
  LeType(
    id: "013",
    nom: "vidéos",
    categorie: "002",
  ),
];
List<LeType> typesLogement = [
  LeType(
    id: "014",
    nom: "Maison à louer",
    categorie: "003",
  ),
  LeType(
    id: "015",
    nom: "Terrains à vendre",
    categorie: "003",
  ),
  LeType(
    id: "016",
    nom: "Maison à vendre",
    categorie: "003",
  ),
  LeType(
    id: "017",
    nom: "Hôtels et auberges",
    categorie: "003",
  ),
];
List<LeType> typesTransport = [
  LeType(
    id: "018",
    nom: "Achat de véhicules, motos",
    categorie: "004",
  ),
  LeType(
    id: "019",
    nom: "Taxi",
    categorie: "004",
  ),
  LeType(
    id: "020",
    nom: "bus",
    categorie: "004",
  ),
  LeType(
    id: "021",
    nom: "Locations véhicules",
    categorie: "004",
  ),
];
List<LeType> typesCommerce = [
  LeType(
    id: "022",
    nom: "boutiques",
    categorie: "005",
  ),
  LeType(
    id: "023",
    nom: "marchés",
    categorie: "005",
  ),
  LeType(
    id: "024",
    nom: "supermarché",
    categorie: "005",
  ),
  LeType(
    id: "025",
    nom: "Annonces ventes",
    categorie: "005",
  ),
];
List<LeType> typesTourisme = [
  LeType(
    id: "026",
    nom: "Sites touristiques",
    categorie: "006",
  ),
  LeType(
    id: "027",
    nom: "climat",
    categorie: "006",
  ),
  LeType(
    id: "028",
    nom: "traditions",
    categorie: "006",
  ),
  LeType(
    id: "028",
    nom: "restaurants",
    categorie: "006",
  ),
  LeType(
    id: "28",
    nom: "langues",
    categorie: "006",
  ),
];
List<LeType> typesLoisirs = [
  LeType(
    id: "029",
    nom: "restaurant",
    categorie: "007",
  ),
  LeType(
    id: "030",
    nom: "Pâtisseries boulangeries",
    categorie: "007",
  ),
  LeType(
    id: "031",
    nom: "Parcs",
    categorie: "007",
  ),
  LeType(
    id: "032",
    nom: "Centres de jeux",
    categorie: "007",
  ),
];
List<LeType> typesDivers = [
  LeType(
    id: "033",
    nom: "hygiènes ",
    categorie: "008",
  ),
  LeType(
    id: "034",
    nom: "Changements climatiques",
    categorie: "008",
  ),
  LeType(
    id: "035",
    nom: "Jeux et concours",
    categorie: "008",
  ),
  LeType(
    id: "036",
    nom: "recyclages",
    categorie: "008",
  ),
  LeType(
    id: "037",
    nom: "Campagnes de sensibilisation",
    categorie: "008",
  ),
];
