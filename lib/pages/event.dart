// event.dart
class Event {
  String title;
  DateTime date;
  String time;
  String location;
  List<String> participants = []; // List to store participants

  Event({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
  });

  // Method to add a participant
  void addParticipant(String participant) {
    participants.add(participant);
  }
}
