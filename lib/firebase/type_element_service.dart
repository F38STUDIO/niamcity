import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/type_element.dart';

class TypeElementService {
  final String teid;

  TypeElementService({required this.teid});

  CollectionReference ref =
      FirebaseFirestore.instance.collection("typeelements");

  // CREATE(non implementé)
  Future<void> createTypeElement() async {
    try {
      //
    } catch (e) {
      print("Error creating typeelement: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<TypeElement>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching typeelements: $e");
      throw e;
    }
  }

  // READ (Find one typeelement by typeelement_id)(non implementé)
  Future<TypeElement?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding typeelement: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateTypeElement(String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating typeelement: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteTypeElement() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting typeelement: $e");
    }
  }
}
