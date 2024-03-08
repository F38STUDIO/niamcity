class Message {
  String id;
  String conteneu;
  bool estAutheur;
  DateTime instant;
  bool lu;
  Message({
    required this.id,
    required this.conteneu,
    required this.estAutheur,
    required this.instant,
    required this.lu,
  });
}
