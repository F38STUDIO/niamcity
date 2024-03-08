import 'package:niamcity/models/type_element.dart';

// Cette liste contient toutes les differentes categories d'Elementes disponibles sur l'application (clinique, maternite, etc...)
// Lorsque vous ajoutez un nouveau type, faites attention au 'id' que vous choisisez. Il sera utilisé pour trier les 'Element'(s).

List<TypeElement> typesSante = [
  TypeElement(
    id: "001",
    nom: "clinique",
    categorie: "001",
  ),
  TypeElement(
    id: "002",
    nom: "HYGIENE",
    categorie: "001",
  ),
  TypeElement(
    id: "003",
    nom: "PHARMACIES",
    categorie: "001",
  ),
  TypeElement(
    id: "004",
    nom: "HOPITAUX",
    categorie: "001",
  ),
  TypeElement(
    id: "005",
    nom: "MERE ET ENFANT",
    categorie: "001",
  ),
  TypeElement(
    id: "006",
    nom: "MATERNITES",
    categorie: "001",
  ),
];

List<TypeElement> typesEducation = [
  TypeElement(
    id: "007",
    nom: "Etudes Sup ",
    categorie: "002",
  ),
  TypeElement(
    id: "008",
    nom: " ECOLES PRIVES",
    categorie: "002",
  ),
  TypeElement(
    id: "009",
    nom: "ECOLES PUBLIQUES",
    categorie: "002",
  ),
  TypeElement(
    id: "010",
    nom: "Centres de formations",
    categorie: "002",
  ),
  TypeElement(
    id: "011",
    nom: "COURS",
    categorie: "002",
  ),
  TypeElement(
    id: "012",
    nom: "DOCUMENTS",
    categorie: "002",
  ),
  TypeElement(
    id: "013",
    nom: "vidéos",
    categorie: "002",
  ),
];
List<TypeElement> typesLogement = [
  TypeElement(
    id: "014",
    nom: "Maison à louer",
    categorie: "003",
  ),
  TypeElement(
    id: "015",
    nom: "Terrains à vendre",
    categorie: "003",
  ),
  TypeElement(
    id: "016",
    nom: "Maison à vendre",
    categorie: "003",
  ),
  TypeElement(
    id: "017",
    nom: "Hôtels et auberges",
    categorie: "003",
  ),
];
List<TypeElement> typesTransport = [
  TypeElement(
    id: "018",
    nom: "Achat de véhicules, motos",
    categorie: "004",
  ),
  TypeElement(
    id: "019",
    nom: "Taxi",
    categorie: "004",
  ),
  TypeElement(
    id: "020",
    nom: "bus",
    categorie: "004",
  ),
  TypeElement(
    id: "021",
    nom: "Locations véhicules",
    categorie: "004",
  ),
];
List<TypeElement> typesCommerce = [
  TypeElement(
    id: "022",
    nom: "boutiques",
    categorie: "005",
  ),
  TypeElement(
    id: "023",
    nom: "marchés",
    categorie: "005",
  ),
  TypeElement(
    id: "024",
    nom: "supermarché",
    categorie: "005",
  ),
  TypeElement(
    id: "025",
    nom: "Annonces ventes",
    categorie: "005",
  ),
];
List<TypeElement> typesTourisme = [
  TypeElement(
    id: "026",
    nom: "Sites touristiques",
    categorie: "006",
  ),
  TypeElement(
    id: "027",
    nom: "climat",
    categorie: "006",
  ),
  TypeElement(
    id: "028",
    nom: "traditions",
    categorie: "006",
  ),
  TypeElement(
    id: "028",
    nom: "restaurants",
    categorie: "006",
  ),
  TypeElement(
    id: "28",
    nom: "langues",
    categorie: "006",
  ),
];
List<TypeElement> typesLoisirs = [
  TypeElement(
    id: "029",
    nom: "restaurant",
    categorie: "007",
  ),
  TypeElement(
    id: "030",
    nom: "Pâtisseries boulangeries",
    categorie: "007",
  ),
  TypeElement(
    id: "031",
    nom: "Parcs",
    categorie: "007",
  ),
  TypeElement(
    id: "032",
    nom: "Centres de jeux",
    categorie: "007",
  ),
];
List<TypeElement> typesDivers = [
  TypeElement(
    id: "033",
    nom: "hygiènes ",
    categorie: "008",
  ),
  TypeElement(
    id: "034",
    nom: "Changements climatiques",
    categorie: "008",
  ),
  TypeElement(
    id: "035",
    nom: "Jeux et concours",
    categorie: "008",
  ),
  TypeElement(
    id: "036",
    nom: "recyclages",
    categorie: "008",
  ),
  TypeElement(
    id: "037",
    nom: "Campagnes de sensibilisation",
    categorie: "008",
  ),
];
