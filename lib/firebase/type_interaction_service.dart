import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/type_interaction.dart';

class TypeInteractionService {
  final String teid;

  TypeInteractionService({required this.teid});

  CollectionReference ref =
      FirebaseFirestore.instance.collection("typeinteractions");

  // CREATE(non implementé)
  Future<void> createTypeInteraction() async {
    try {
      //
    } catch (e) {
      print("Error creating typeinteraction: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<TypeInteraction>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching typeinteractions: $e");
      throw e;
    }
  }

  // READ (Find one typeinteraction by typeinteraction_id)(non implementé)
  Future<TypeInteraction?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding typeinteraction: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateTypeInteraction(
      String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating typeinteraction: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteTypeInteraction() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting typeinteraction: $e");
    }
  }
}
