import 'package:cloud_firestore/cloud_firestore.dart';

class JournalEntry {
  final String text;
  final Timestamp date;

  JournalEntry({required this.text, required this.date});

  JournalEntry.fromJson(Map<String, dynamic> json)
      : this(
          text: json['text'],
          date: json['date'],
        );
}
