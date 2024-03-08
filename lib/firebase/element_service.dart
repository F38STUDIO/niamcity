import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/element.dart';

class ElementService {
  final String eid;

  ElementService({required this.eid});

  CollectionReference ref = FirebaseFirestore.instance.collection("elements");

  // CREATE(non implementé)
  Future<void> createElement() async {
    try {
      //
    } catch (e) {
      print("Error creating element: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<MonElement>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching elements: $e");
      throw e;
    }
  }

  // READ (Find one element by element_id)(non implementé)
  Future<MonElement?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding element: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateElement(String nom, String adresse, int numero) async {
    try {
      await ref.doc(eid).update({
        //
      });
    } catch (e) {
      print("Error updating element: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteElement() async {
    try {
      await ref.doc(eid).delete();
    } catch (e) {
      print("Error deleting element: $e");
    }
  }

  //Distance (non implementée)
  double distance(double latitude, double longiture) {
    return 0.0;
  }
}
