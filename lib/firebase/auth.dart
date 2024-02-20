// ici il faut mettre toutes les fonction et methodes firebase qui sont liés à l'autentification.
// ça va permettre une meilleure authentification du code
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Fonction d'inscription avec numéro de téléphone et mot de passe
  Future<void> signUp(
    String name,
    String phoneNumber,
    String password,
  ) async {
    try {
      final UserCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:
            '$phoneNumber@yourdomain.com', // Firebase Auth nécessite un email, nous utilisons un format arbitraire ici
        password: password,
      );
      // Utilisateur inscrit avec succès
    } catch (e) {
      print(e.toString());
      // Gérer les erreurs d'inscription
    }
  }

  // Fonction de connexion avec numéro de téléphone et mot de passe
  Future<void> signIn(String phoneNumber, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:
            '$phoneNumber@yourdomain.com', // Utilisation du même format d'email arbitraire
        password: password,
      );
      // Utilisateur connecté avec succès
    } catch (e) {
      // Gérer les erreurs de connexion
    }
  }
}
