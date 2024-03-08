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
          );
        }).toList();
      });
    } catch (e) {
      print("Error fetching users: $e");
      rethrow;
    }
  }

  // READ (Find one user by uid)
  Future<Utilisateur?> findById() async {
    try {
      DocumentSnapshot doc = await ref.doc(uid).get();
      if (doc.exists) {
        return Utilisateur(
          id: doc.id,
          nom: doc['nom'],
          adresse: doc['adresse'],
          numero: doc['numero'],
        );
      } else {
        return null;
      }
    } catch (e) {
      print("Error finding user: $e");
      rethrow;
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
