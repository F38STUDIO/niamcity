import 'package:flutter/material.dart';
import 'package:niamcity/donnee_fixes/couleurs.dart';

import '../donnee_fixes/constantes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "NiamCity",
          style: TextStyle(
              color: Couleurs.e, fontSize: 30.0, fontWeight: FontWeight.w900),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(12.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    color: Couleurs.d,
                    elevation: 4.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          listCategorie[index]['icon'],
                          size: 48.0,
                          color: Couleurs.b,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          listCategorie[index]['name'],
                          style: const TextStyle(
                              color: Couleurs.a,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
