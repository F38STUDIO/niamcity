import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../donnee_fixes/categories.dart';
import '../donnee_fixes/constantes.dart';
import '../donnee_fixes/couleurs.dart';
import '../map/directions_model.dart';
import '../models/categorie.dart';
import '../models/element.dart';
import '../models/type.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  ////////////////////////////VARIABLES ET FONCTIONS(STATES)//////////////////////////////////////////////////////////
  //Choix de categorie et type
  Categorie categorieSelectionnee = categories[0];
  LeType typeSelectionne = categories[0].types[0];

  //Choix de Maptype
  MapType _mapTypeSelectionne = MapType.normal;
  List<Map<String, MapType>> mapTypeList = [
    {"Normale": MapType.normal},
    {"hybrid": MapType.hybrid},
    {"satellite": MapType.satellite},
    {"terrain": MapType.terrain},
  ];
  //cette liste est sensée contenir le resuletat de la requete <chercher tout element dont le type correspond à la variable _typeSelctionné>
  List<MonElement> _elementsAffiches = elements01;
  //Element selectionné
  MonElement? elementSelectionne;

//origine et destination
  LatLng? origin;
  LatLng? destination;
  // static  LatLng destination =
  //     LatLng(16.429177284601234, 8.322645718749992);

  // LatLng? destination;
  //
  GoogleMapController? _googleMapController;
  Directions? _info;

//Fonction pour les polyLinesPoints
  // void getPolyPoints() async {
  //   PolylinePoints polyLinePoints = PolylinePoints();
  //   PolylineResult result = await polyLinePoints.getRouteBetweenCoordinates(
  //       "AIzaSyBoNlwTrZ78AQF1FZnF1YLygeGpFHWJAhM",
  //       PointLatLng(origin.latitude, origin.longitude),
  //       PointLatLng(destination!.latitude, destination!.longitude));
  //   if (result.points.isNotEmpty) {
  //     for (var element in result.points) {
  //       polylineCoordinates.add(LatLng(element.latitude, element.longitude));
  //     }

  //     setState(() {});
  //   }
  // }

  // Corrent Location of the user
  LocationData? currentLocation;
  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((value) {
      origin = LatLng(value.latitude!, value.longitude!);
      return currentLocation = value;
    });
    GoogleMapController googleMapController = _googleMapController!;
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 13.5,
              target: LatLng(newLoc.latitude!, newLoc.longitude!))));
      setState(() {});
    });
  }

  //////////////////////////////////////////////////////////////////////////////////////
  ///
  @override
  void initState() {
    getCurrentLocation();
    //getPolyPoints();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///////////////////////VARIABLES DANS BUILDcONTEXT/////////////////////////////////////////////////////
// Element selectionné
    MonElement _elementSelectionne = _elementsAffiches[0];
    //origne et destination
    const LatLng origin = LatLng(17.6110005, 8.080946499999982);
    LatLng destination =
        LatLng(_elementSelectionne.latitude, _elementSelectionne.longitude);
    //PolylineCoordinates
    List<LatLng> polylineCoordinates = [];
    //...
    TextStyle? dropdownStyle = const TextStyle(
        color: Couleurs.b,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold);
    Decoration dropdownDecoration = BoxDecoration(
        color: Couleurs.d, //background color of dropdown button
        border: Border.all(
            color: Colors.white, width: 1), //border of dropdown button
        borderRadius:
            BorderRadius.circular(30), //border raiuds of dropdown button
        boxShadow: const <BoxShadow>[
          //apply shadow on Dropdown button
          BoxShadow(
              color: Couleurs.b, //shadow for button
              blurRadius: 5) //blur radius of shadow
        ]);
    // Créez un ensemble vide de marqueurs en dehors de la méthode map
    Set<Marker> markers = {};

// Utilisez la méthode map pour créer les marqueurs et ajoutez-les à l'ensemble
    markers = {
      const Marker(markerId: MarkerId("origin"), position: origin, flat: true, colo)
    };

    ////////////////////////////////////////////////////////////////////////////////////////////////
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
         ouù!g_*ùpj'"ezq'a"   ),
          ),
          //Dropdown pour selectionner le type de map
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Couleurs.a, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      borderRadius: BorderRadius.circular(30),
                      underline: Container(),
                      style: const TextStyle(
                          color: Couleurs.e, fontWeight: FontWeight.bold),
                      value: mapTypeList[0]["Normale"],
                      items: mapTypeList
                          .map((e) => DropdownMenuItem<MapType>(
                              value: e.values.first, child: Text(e.keys.first)))
                          .toList(),
                      onChanged: (MapType? newValue) {
                        setState(() {
                          _mapTypeSelectionne = newValue!;
                        });
                      }),
                ),
              ),
            )
          ],
        ),
        body: currentLocation == null
            ? const Center(
                child: Text("Chargement de votre position..."),
              )
            : Stack(
                children: [
                  //La carte
                  GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: _mapTypeSelectionne,
                    initialCameraPosition: const CameraPosition(
                      target: origin,
                      zoom: 14.4746,
                    ),
                    polylines: {
                      if (_info != null)
                        Polyline(
                          polylineId: const PolylineId("overview_polyline"),
                          points: polylineCoordinates,
                          // points: _info!.polylinePoints
                          //     .map((e) => LatLng(e.latitude, e.longitude))
                          //     .toList(),
                          // color: Couleurs.b,
                          // width: 5,
                        )
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _googleMapController = controller;
                    },
                    markers: markers,
                  ),
                  //les 2 dropdowns
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 8, 1, 0),
                    child: Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
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
                                          )))
                                      .toList(),
                                  onChanged: (Categorie? newValue) =>
                                      setState(() {
                                        categorieSelectionnee = newValue!;
                                        typeSelectionne = newValue.types[0];
                                      })),
                            ),
                          ),
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
                                      .map((e) => DropdownMenuItem<LeType>(
                                          value: e,
                                          child: Text(
                                            e.nom,
                                            overflow: TextOverflow.ellipsis,
                                          )))
                                      .toList(),
                                  onChanged: (LeType? newValue) => setState(() {
                                        typeSelectionne = newValue!;
                                      })),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        //Le boutton Ma position
        floatingActionButton: FloatingActionButton(
          backgroundColor: Couleurs.d,
          foregroundColor: Couleurs.a,
          onPressed: _goToOrigin,
          child: const Icon(Icons.person_pin_circle_outlined),
        ),
      ),
    );
  }

  Future<void> _goToOrigin() async {
    final GoogleMapController? controller = _googleMapController;
    await controller!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: origin!,
            tilt: 59.440717697143555,
            zoom: 14.4746)));
  }
}
