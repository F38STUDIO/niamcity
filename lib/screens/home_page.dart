import 'package:flutter/material.dart';

import '../donnee_fixes/constantes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("NiamCity"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    listCategorie[index]['icon'],
                    size: 48.0,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 8.0),
                  Text(listCategorie[index]['name']),
                ],
              ),
            );
          }),
    );
  }
}
