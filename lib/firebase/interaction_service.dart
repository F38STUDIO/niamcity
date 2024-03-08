import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/interaction.dart';

class InteractionService {
  final String teid;

  InteractionService({required this.teid});

  CollectionReference ref =
      FirebaseFirestore.instance.collection("interactions");

  // CREATE(non implementé)
  Future<void> createInteraction() async {
    try {
      //
    } catch (e) {
      print("Error creating interaction: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<Interaction>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching interactions: $e");
      throw e;
    }
  }

  // READ (Find one interaction by interaction_id)(non implementé)
  Future<Interaction?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding interaction: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateInteraction(String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating interaction: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteInteraction() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting interaction: $e");
    }
  }
}
