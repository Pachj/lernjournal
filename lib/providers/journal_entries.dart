import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lernjournal/models/journal_entry.dart';

class JournalEntries {
  final List<JournalEntry> entries;

  JournalEntries._getAll({required this.entries});

  static Future<JournalEntries> getAll() async {
    final journalEntries =
        await FirebaseFirestore.instance.collection('entries').get().then(
              (collection) => collection.docs
                  .map(
                    (entry) => JournalEntry.fromJson(
                      entry.data(),
                      entry.id,
                    ),
                  )
                  .toList(),
            );

    return JournalEntries._getAll(entries: journalEntries);
  }
}
