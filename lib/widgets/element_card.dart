import 'package:flutter/material.dart';

import '../donnee_fixes/couleurs.dart';
import '../models/element.dart';

class ElementCard extends StatelessWidget {
  final MonElement element;
  const ElementCard({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
      child: Container(
        height: 108,
        decoration: BoxDecoration(
            color: Couleurs.g200,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Couleurs.a)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      element.nom,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Couleurs.c,
                          fontSize: 16),
                    ),
                    const Text(
                      "200m de vous",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Couleurs.e,
                          fontSize: 13),
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // nombre de vues
                          NombreDeVues(),
                          // nombre de consulatiaon ou de vues

                          NombreDeStars(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NombreDeStars extends StatelessWidget {
  const NombreDeStars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: Couleurs.d,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Couleurs.b)),
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "1562",
                    style: TextStyle(color: Couleurs.b),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 18,
                  ),
                ]),
          )),
    );
  }
}

class NombreDeVues extends StatelessWidget {
  const NombreDeVues({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: Couleurs.a,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Couleurs.d)),
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "12",
                    style: TextStyle(color: Couleurs.e),
                  ),
                  Icon(
                    Icons.open_in_browser,
                    color: Couleurs.e,
                    size: 18,
                  ),
                ]),
          )),
    );
  }
}
