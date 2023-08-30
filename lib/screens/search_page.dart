import 'package:flutter/material.dart';

import '../donnee_fixes/couleurs.dart';
import '../models/element.dart';
import '../utils/element_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MonElement> elementsMainList = [
    MonElement(
      id: "id",
      nom: "Université sani kalla idi ali babbattio",
      imgs: ["", "", ""],
      description: "Une Univesité à Maradi",
      type: "type",
      latitude: 00,
      longitude: 00,
      certifie: false,
    ),
    MonElement(
      id: "id",
      nom: "Université sani",
      imgs: ["", "", ""],
      description: "Une Univesité à Maradi",
      type: "type",
      latitude: 00,
      longitude: 00,
      certifie: false,
    ),
    MonElement(
      id: "id",
      nom: "Université Aboubacar",
      imgs: ["", "", ""],
      description: "Une Univesité à Maradi",
      type: "type",
      latitude: 00,
      longitude: 00,
      certifie: false,
    ),
    MonElement(
      id: "id",
      nom: "Université  idi",
      imgs: ["", "", ""],
      description: "Une Univesité à Maradi",
      type: "type",
      latitude: 00,
      longitude: 00,
      certifie: false,
    ),
    MonElement(
      id: "id",
      nom: "Université fada 20",
      imgs: ["", "", ""],
      description: "Une Univesité à Maradi",
      type: "type",
      latitude: 00,
      longitude: 00,
      certifie: false,
    ),
    MonElement(
      id: "id",
      nom: "Université sani kalla idi",
      imgs: ["", "", ""],
      description: "Une Univesité à Maradi",
      type: "type",
      latitude: 00,
      longitude: 00,
      certifie: false,
    ),
  ];
  List<MonElement> elementsDisplayList = List.from(elementsMainList);
  //la fonction
  void updateList(String value) {
    setState(() {
      elementsDisplayList = elementsMainList
          .where((element) =>
              element.nom.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.g300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Couleurs.d,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Text(
            "Rechercher",
            style: TextStyle(
                color: Couleurs.a, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Rechercher

          //searchBar
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Couleurs.g200,
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Couleurs.a),
              ),
              child: TextField(
                onChanged: (value) => updateList(value),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      weight: 10.0,
                      color: Couleurs.c,
                    )),
              ),
            ),
          ),
          // Filtres

          // Liste triée
          Expanded(
            child: ListView.builder(
                itemCount: elementsDisplayList.length,
                itemBuilder: (context, index) {
                  return ElementCard(element: elementsDisplayList[index]);
                }),
          )
        ],
      ),
    );
  }
}
