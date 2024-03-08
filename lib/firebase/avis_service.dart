import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/avis.dart';

class AvisService {
  final String teid;

  AvisService({required this.teid});

  CollectionReference ref = FirebaseFirestore.instance.collection("aviss");

  // CREATE(non implementé)
  Future<void> createAvis() async {
    try {
      //
    } catch (e) {
      print("Error creating avis: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<Avis>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching aviss: $e");
      throw e;
    }
  }

  // READ (Find one avis by avis_id)(non implementé)
  Future<Avis?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding avis: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateAvis(String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating avis: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteAvis() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting avis: $e");
    }
  }
}
