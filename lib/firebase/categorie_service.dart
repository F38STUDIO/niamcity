import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/categorie.dart';

class CategorieService {
  final String teid;

  CategorieService({required this.teid});

  CollectionReference ref = FirebaseFirestore.instance.collection("categories");

  // CREATE(non implementé)
  Future<void> createCategorie() async {
    try {
      //
    } catch (e) {
      print("Error creating categorie: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<Categorie>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching categories: $e");
      throw e;
    }
  }

  // READ (Find one categorie by categorie_id)(non implementé)
  Future<Categorie?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding categorie: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateCategorie(String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating categorie: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteCategorie() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting categorie: $e");
    }
  }
}
