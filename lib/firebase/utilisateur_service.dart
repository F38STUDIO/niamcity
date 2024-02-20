import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/utilisateur.dart';

class UtilisateurService {
  final String uid;

  UtilisateurService({required this.uid});

  CollectionReference ref = FirebaseFirestore.instance.collection("users");

  // CREATE
  Future<void> createUser(String nom, String adresse, int numero) async {
    try {
      await ref.doc(uid).set({
        "nom": nom,
        "adresse": adresse,
        "numero": numero,
      });
    } catch (e) {
      print("Error creating user: $e");
    }
  }

  // READ (Real-time updates)
  Stream<List<Utilisateur>> findAll() {
    try {
      return ref.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return Utilisateur(
            id: doc.id,
            nom: doc['nom'],
            adresse: doc['adresse'],
            numero: doc['numero'],
            // Add other properties if needed
          );
        }).toList();
      });
    } catch (e) {
      print("Error fetching users: $e");
      throw e; // You may want to handle this error more gracefully
    }
  }

  // READ (Find one user by uid)
  Future<Utilisateur?> find() async {
    try {
      DocumentSnapshot doc = await ref.doc(uid).get();
      if (doc.exists) {
        return Utilisateur(
          id: doc.id,
          nom: doc['nom'],
          adresse: doc['adresse'],
          numero: doc['numero'],
          // Add other properties if needed
        );
      } else {
        return null;
      }
    } catch (e) {
      print("Error finding user: $e");
      throw e; // You may want to handle this error more gracefully
    }
  }

  // UPDATE
  Future<void> updateUser(String nom, String adresse, int numero) async {
    try {
      await ref.doc(uid).update({
        "nom": nom,
        "adresse": adresse,
        "numero": numero,
      });
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  // DELETE
  Future<void> deleteUser() async {
    try {
      await ref.doc(uid).delete();
    } catch (e) {
      print("Error deleting user: $e");
    }
  }
}
