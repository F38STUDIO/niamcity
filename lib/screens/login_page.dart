import 'package:flutter/material.dart';
import 'package:niamcity/firebase/auth.dart';
import 'package:niamcity/screens/registration_page.dart';
import '../donnee_fixes/couleurs.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Connexion",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: Couleurs.c),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Form(
            child: Column(
              children: <Widget>[
                const Text(
                  ' Nous vous Attendons',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 18,
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
                  "Vous n\'avez pas de compte ?",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegistrationPage(),
                    ));
                  },
                  child: const Text(
                    "Inscrivez-Vous !",
                    style: TextStyle(fontSize: 16, color: Couleurs.b),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, bottom: 15, top: 15)),
                  onPressed: () {
                    String phoneNumber = _phoneNumberController.text;
                    String password = _passwordController.text;
                    _authService.signIn(phoneNumber, password);

                    // Vous pouvez accéder aux valeurs des champs de texte
                    // en utilisant _nameController.text, _phoneNumberController.text,
                    // et _passwordController.text.
                    // Ajoutez ici votre logique d'inscription.
                  },
                  child: const Text(
                    'Se Connecter',
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
      ),
    );
  }
}
