import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lernjournal/models/journal_entry.dart';

class UpdateEntry {
  static void update({required JournalEntry journalEntry}) async {
    await FirebaseFirestore.instance
        .collection('entries')
        .doc(journalEntry.id)
        .update({'date': journalEntry.timestamp, 'text': journalEntry.text});
  }
}
