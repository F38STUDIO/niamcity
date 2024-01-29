import 'package:flutter/material.dart';
import 'package:niamcity/screens/forms/form_page.dart';
import 'package:niamcity/screens/login_page.dart';

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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Creation_page()));
                  // Vous pouvez accéder aux valeurs des champs de texte
                  // en utilisant _nameController.text, _phoneNumberController.text,
                  // et _passwordController.text.
                  // Ajoutez ici votre logique d'inscription.
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
