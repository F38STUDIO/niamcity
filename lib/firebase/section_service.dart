import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/section.dart';

class SectionService {
  final String teid;

  SectionService({required this.teid});

  CollectionReference ref = FirebaseFirestore.instance.collection("sections");

  // CREATE(non implementé)
  Future<void> createSection() async {
    try {
      //
    } catch (e) {
      print("Error creating section: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<Section>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching sections: $e");
      throw e;
    }
  }

  // READ (Find one section by section_id)(non implementé)
  Future<Section?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding section: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateSection(String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating section: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteSection() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting section: $e");
    }
  }
}
