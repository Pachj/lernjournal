import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class JournalEntry {
  final String text;
  final Timestamp timestamp;

  JournalEntry({required this.text, required this.timestamp});

  JournalEntry.fromJson(Map<String, dynamic> json)
      : this(
          text: json['text'],
          timestamp: json['date'],
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
