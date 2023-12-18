import 'package:flutter/material.dart';
import 'package:niamcity/donnee_fixes/couleurs.dart';
import 'package:niamcity/screens/registration_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Profil',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w800, color: Couleurs.c),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Vous n\'avez pas encore de compte.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, bottom: 15, top: 15)),
                onPressed: () {
                  // Naviguez vers l'écran d'inscription ici
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegistrationPage(),
                  ));
                  // Vous pouvez utiliser Navigator pour cela.
                },
                child: const Text(
                  'S\'inscrivez-vous !',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Couleurs.c),
                ),
              ),
            ],
          ),
        ));
  }
}
