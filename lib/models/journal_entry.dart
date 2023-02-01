import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class JournalEntry {
  final String text;
  final Timestamp timestamp;
  final String id;

  JournalEntry({
    required this.text,
    required this.timestamp,
    required this.id,
  });

  JournalEntry.fromJson(Map<String, dynamic> json, String id)
      : this(
          text: json['text'],
          timestamp: json['date'],
          id: id,
        );

  String get localDate {
    return DateFormat('dd.MM.yyyy').format(
      timestamp.toDate(),
    );
  }

  DateTime get dateAsDateTime {
    return timestamp.toDate();
  }
}
