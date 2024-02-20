import 'package:flutter/material.dart';
import 'package:niamcity/firebase/auth.dart';
import 'package:niamcity/screens/login_page.dart';
import 'package:niamcity/screens/profil1_paage.dart';

import '../donnee_fixes/couleurs.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Inscription',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: Couleurs.c),
        ),
      ),
      body: const Registration(),
    );
  }
}

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Form(
          child: Column(
            children: <Widget>[
              const Text(
                "Inscrivez-Vous Pour Profiter De Nos Meilleurs Services.",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: 'Nom',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                    labelText: 'Numéro de téléphone',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const Text(
                "Avez-vous déjà un compte ?",
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
                },
                child: const Text(
                  "Connectez-Vous !",
                  style: TextStyle(fontSize: 16, color: Couleurs.b),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, bottom: 15, top: 15)),
                onPressed: () async {
                  String name = _nameController.text;
                  String phoneNumber = _phoneNumberController.text;
                  String password = _passwordController.text;
                  _authService.signUp(name, phoneNumber, password);
                  // Vous pouvez également ajouter ici la logique pour
                  // Appel de la fonction signUp
                  // Vérifier si tous les champs sont remplis
                  if (name.isEmpty || phoneNumber.isEmpty || password.isEmpty) {
                    // Afficher un message d'erreur
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Veuillez remplir tous les champs'),
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    // Appel de la fonction signUp
                    await _authService.signUp(name, phoneNumber, password);

                    // Navigation vers la page de profil ou toute autre page désirée
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          const ProfilePage1(), // Remplace la page actuelle par la page de profil
                    ));
                  }
                },
                child: const Text(
                  'S\'inscrire',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Couleurs.c),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
