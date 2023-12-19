import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../donnee_fixes/categories.dart';
import '../donnee_fixes/couleurs.dart';
import '../models/categorie.dart';
import '../models/element.dart';
import '../models/type.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  Categorie categorieSelectionnee = categories[0];
  LeType typeSelectionne = categories[0].types[0];
  MapType _mapTypeSelectionne = MapType.normal;
  List<Map<String, MapType>> mapTypeList = [
    {"Normale": MapType.normal},
    {"hybrid": MapType.hybrid},
    {"satellite": MapType.satellite},
    {"terrain": MapType.terrain},
  ];
  //cette liste est sensée contenir le resuletat de la requete <chercher tout element dont le type correspond à la variable _typeSelctionné>
  static List<MonElement> elementgsAffiche = [
    //une random lite des elemements à afficher comme marqueurs sur la carte
    MonElement(
        id: "id",
        nom: "nom1",
        imgs: [],
        description: "description1",
        type: "type",
        latitude: 37.43296265331129,
        longitude: -122.08832357078792,
        certifie: true),
    MonElement(
        id: "id",
        nom: "nom2",
        imgs: [],
        description: "description2",
        type: "type",
        latitude: 37.43286494644912,
        longitude: -122.08823740482332,
        certifie: true),
  ];
  Set<Marker> marqueurs = {
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(
            elementgsAffiche[0].latitude, elementgsAffiche[0].longitude)),
    Marker(
        markerId: MarkerId("2"),
        position: LatLng(
            elementgsAffiche[1].latitude, elementgsAffiche[1].longitude)),
  };
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _positionInitiale = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _origin = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
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
        body: Stack(
          children: [
            //

            // La carte
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: _mapTypeSelectionne,
              initialCameraPosition: _positionInitiale,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: marqueurs,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 1, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
                          onChanged: (Categorie? newValue) => setState(() {
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

  Future<void> _goToOrigin() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_origin));
  }
}
