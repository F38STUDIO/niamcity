import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message.dart';

class MessageService {
  final String teid;

  MessageService({required this.teid});

  CollectionReference ref = FirebaseFirestore.instance.collection("messages");

  // CREATE(non implementé)
  Future<void> createMessage() async {
    try {
      //
    } catch (e) {
      print("Error creating message: $e");
    }
  }

  // READ (Real-time updates)(non implementé)
  Stream<List<Message>> findAll() {
    try {
      //
      return Stream.empty();
    } catch (e) {
      print("Error fetching messages: $e");
      throw e;
    }
  }

  // READ (Find one message by message_id)(non implementé)
  Future<Message?> findById() async {
    try {
      //
    } catch (e) {
      print("Error finding message: $e");
      throw e;
    }
  }

  // UPDATE((non implementé))
  Future<void> updateMessage(String nom, String adresse, int numero) async {
    try {
      await ref.doc(teid).update({
        //
      });
    } catch (e) {
      print("Error updating message: $e");
    }
  }

  // DELETE (ok)
  Future<void> deleteMessage() async {
    try {
      await ref.doc(teid).delete();
    } catch (e) {
      print("Error deleting message: $e");
    }
  }
}
