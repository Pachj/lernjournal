import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lernjournal/models/journal_entry.dart';

class JournalEntries {
  final List<JournalEntry> entries;

  JournalEntries._create({required this.entries});

  static Future<JournalEntries> create() async {
    final journalEntries =
        await FirebaseFirestore.instance.collection('entries').get().then(
              (collection) => collection.docs
                  .map(
                    (entry) => JournalEntry.fromJson(
                      entry.data(),
                    ),
                  )
                  .toList(),
            );

    return JournalEntries._create(entries: journalEntries);
  }
}
