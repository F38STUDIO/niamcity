import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/parametres.dart';

class ParametresService {
  final String teid;

  ParametresService({required this.teid});

  CollectionReference ref =
      FirebaseFirestore.instance.collection("parametress");

  // CREATE(non implementé)
  Future<void> createParametres() async {
    try {
      //
    } catch (e) {
      print("Error creating parametres: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<Parametres>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching parametress: $e");
      throw e;
    }
  }

  // READ (Find one parametres by parametres_id)(non implementé)
  Future<Parametres?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding parametres: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateParametres(String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating parametres: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteParametres() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting parametres: $e");
    }
  }
}
