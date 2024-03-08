import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/signalement.dart';

class SignalementService {
  final String teid;

  SignalementService({required this.teid});

  CollectionReference ref =
      FirebaseFirestore.instance.collection("signalements");

  // CREATE(non implementé)
  Future<void> createSignalement() async {
    try {
      //
    } catch (e) {
      print("Error creating signalement: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<Signalement>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching signalements: $e");
      throw e;
    }
  }

  // READ (Find one signalement by signalement_id)(non implementé)
  Future<Signalement?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding signalement: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateSignalement(String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating signalement: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteSignalement() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting signalement: $e");
    }
  }
}
