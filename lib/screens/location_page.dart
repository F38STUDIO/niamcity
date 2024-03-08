import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../donnee_fixes/categories.dart';
import '../donnee_fixes/couleurs.dart';
import '../models/categorie.dart';
import '../models/element.dart';
import '../models/type_element.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  //////////////////////////////////////////////////////////////////////////////
  Set<Polyline> polylines = {};

  // Sélection des catégories et types par défaut
  Categorie categorieSelectionnee = categories[0];
  TypeElement typeSelectionne = categories[0].types[0];

  // Sélection du type de carte par défaut
  MapType _mapTypeSelectionne = MapType.normal;

  // Liste des types de carte disponibles
  List<Map<String, MapType>> mapTypeList = [
    {"Normale": MapType.normal},
    {"hybrid": MapType.hybrid},
    {"satellite": MapType.satellite},
    {"terrain": MapType.terrain},
  ];

  // Marqueur pour la position de l'utilisateur
  Marker utilisateurMarker = const Marker(markerId: MarkerId("utilisateur"));
  // Marquer selectionné.
  Marker? markeurSellectionnee;

  // Indique si la position de la caméra a déjà été initialisée
  bool _isInitialCameraPositionSet = false;

  // Liste d'éléments à afficher comme marqueurs sur la carte
  // Liste d'éléments à afficher comme marqueurs sur la carte
  static List<MonElement> elementsAffiches = [
    MonElement(
      id: "nom1", // Utilisez le nom comme ID
      nom: "nom1",
      imgs: [],
      description: "description1",
      type: "type",
      latitude: 37.43296265331129,
      longitude: -122.08832357078792,
      certifie: true,
    ),
    MonElement(
      id: "nom2", // Utilisez le nom comme ID
      nom: "nom2",
      imgs: [],
      description: "description2",
      type: "type",
      latitude: 37.43286494644912,
      longitude: -122.08823740482332,
      certifie: true,
    ),
  ];

// Ensemble de marqueurs pour les éléments à afficher sur la carte
  // Ensemble de marqueurs pour les éléments à afficher sur la carte
  Set<Marker> marqueurs = {};

  // Contrôleur de la carte Google
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // Position initiale de la caméra
  static const CameraPosition _positionInitiale = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // Méthode pour demander la permission de localisation
  Future<void> _requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Location permission denied');
    }
  }

////////////////////////////////////////////////////////////////////////////////
  void _onMarkerTapped(Marker mk) {
    // Supprimer l'ancienne polyligne
    setState(() {
      markeurSellectionnee = mk;
    });
  }

  // Méthode pour obtenir la position de l'utilisateur
  Future<void> _getUserLocation() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Mise à jour du marqueur de la position de l'utilisateur
    setState(() {
      utilisateurMarker = Marker(
        markerId: const MarkerId("utilisateur"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );
    });

    // Définir la position initiale de la caméra uniquement si elle n'a pas été définie auparavant
    if (!_isInitialCameraPositionSet) {
      final GoogleMapController controller = await _controller.future;
      await controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
      );
      _isInitialCameraPositionSet = true;
    }

    // Mettre à jour la position de l'utilisateur toutes les X secondes
    const Duration interval = Duration(seconds: 8);
    Timer.periodic(interval, (Timer t) async {
      var newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Mise à jour du marqueur de la position de l'utilisateur
      setState(() {
        utilisateurMarker = Marker(
          markerId: const MarkerId("utilisateur"),
          position: LatLng(newPosition.latitude, newPosition.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        );
      });
    });
  }

  // Méthode pour recentrer la caméra sur la position initiale de l'utilisateur
  Future<void> _goToOrigin() async {
    // Afficher la polyligne entre la position de l'utilisateur et le marqueur actuel

    CameraPosition origin = CameraPosition(
      bearing: 192.8334901395799,
      target: utilisateurMarker.position,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
    );
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(origin));
  }

////////////////////////////////////////////////////////////////////////////////
  // Méthode appelée à l'initialisation de la page
  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _getUserLocation();

    // Move the initialization of marqueurs here
    marqueurs = Set.from(elementsAffiches.map((element) {
      return Marker(
        markerId: MarkerId(element.id),
        position: LatLng(element.latitude, element.longitude),
        onTap: () => _onMarkerTapped(Marker(
            markerId: MarkerId(element.id),
            position: LatLng(element.latitude, element.longitude))),
      );
    }));
  }

  // Méthode pour construire l'interface utilisateur
  @override
  Widget build(BuildContext context) {
    TextStyle? dropdownStyle = const TextStyle(
      color: Couleurs.b,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
    );

    Decoration dropdownDecoration = BoxDecoration(
      color: Couleurs.d,
      border: Border.all(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(30),
      boxShadow: const <BoxShadow>[
        BoxShadow(color: Couleurs.b, blurRadius: 5),
      ],
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Couleurs.d,
          title: const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Text(
              "Maps",
              style: TextStyle(
                color: Couleurs.a,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //
          // Dropdown pour sélectionner le type de carte
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Couleurs.a,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(30),
                    underline: Container(),
                    style: const TextStyle(
                      color: Couleurs.e,
                      fontWeight: FontWeight.bold,
                    ),
                    value: mapTypeList[0]["Normale"],
                    items: mapTypeList
                        .map((e) => DropdownMenuItem<MapType>(
                              value: e.values.first,
                              child: Text(e.keys.first),
                            ))
                        .toList(),
                    onChanged: (MapType? newValue) {
                      setState(() {
                        _mapTypeSelectionne = newValue!;
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            // La carte
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: _mapTypeSelectionne,
              initialCameraPosition: _positionInitiale,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: {...marqueurs, utilisateurMarker},
              polylines: markeurSellectionnee == null
                  ? {}
                  : {
                      Polyline(
                        polylineId: const PolylineId("itineraire"),
                        color: Colors.blue,
                        width: 3,
                        points: [
                          markeurSellectionnee!.position,
                          utilisateurMarker.position
                        ],
                      )
                    },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 1, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Dropdown pour sélectionner la catégorie
                  DecoratedBox(
                    decoration: dropdownDecoration,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: DropdownButton(
                        alignment: AlignmentDirectional.center,
                        borderRadius: BorderRadius.circular(30),
                        underline: Container(),
                        dropdownColor: Couleurs.d,
                        style: dropdownStyle,
                        value: categorieSelectionnee,
                        items: categories
                            .map((e) => DropdownMenuItem<Categorie>(
                                  value: e,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    e.nom,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        onChanged: (Categorie? newValue) => setState(() {
                          categorieSelectionnee = newValue!;
                          typeSelectionne = newValue.types[0];
                        }),
                      ),
                    ),
                  ),
                  // Dropdown pour sélectionner le type
                  DecoratedBox(
                    decoration: dropdownDecoration,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: DropdownButton(
                        alignment: AlignmentDirectional.center,
                        borderRadius: BorderRadius.circular(30),
                        underline: Container(),
                        dropdownColor: Couleurs.d,
                        style: dropdownStyle,
                        value: typeSelectionne,
                        items: categorieSelectionnee.types
                            .map((e) => DropdownMenuItem<TypeElement>(
                                  value: e,
                                  child: Text(
                                    e.nom,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        onChanged: (TypeElement? newValue) => setState(() {
                          typeSelectionne = newValue!;
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Couleurs.d,
          foregroundColor: Couleurs.a,
          onPressed: _goToOrigin,
          child: const Icon(Icons.person_pin_circle_outlined),
        ),
      ),
    );
  }
}
