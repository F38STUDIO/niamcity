import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/ville.dart';

class VilleService {
  final String teid;

  VilleService({required this.teid});

  CollectionReference ref = FirebaseFirestore.instance.collection("villes");

  // CREATE(non implementé)
  Future<void> createVille() async {
    try {
      //
    } catch (e) {
      print("Error creating ville: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<Ville>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching villes: $e");
      throw e;
    }
  }

  // READ (Find one ville by ville_id)(non implementé)
  Future<Ville?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding ville: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateVille(String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating ville: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteVille() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting ville: $e");
    }
  }
}
