import 'package:cloud_firestore/cloud_firestore.dart';

class Notes {
  final String? notesId;
  final String notes;
  final String timeStamp;

  const Notes({
    this.notesId,
    required this.notes,
    required this.timeStamp,
  });

  toJson() {
    return {
      "notes": notes,
      "timestamp": timeStamp,
    };
  }

  factory Notes.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Notes(
      notesId: doc.id,
      notes: data["notes"],
      timeStamp: data["timeStamp"].toString(),
    );
  }
}
