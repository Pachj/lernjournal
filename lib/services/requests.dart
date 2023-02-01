import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/journal_entry.dart';

class Requests {
  static void create({required JournalEntry journalEntry}) async {
    await FirebaseFirestore.instance
        .collection('entries')
        .add({'date': journalEntry.timestamp, 'text': journalEntry.text});
  }

  static void update({required JournalEntry journalEntry}) async {
    await FirebaseFirestore.instance
        .collection('entries')
        .doc(journalEntry.id)
        .update({'date': journalEntry.timestamp, 'text': journalEntry.text});
  }
}
