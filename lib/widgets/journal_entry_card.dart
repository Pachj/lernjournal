import 'package:flutter/material.dart';
import 'package:lernjournal/models/journal_entry.dart';
import 'package:lernjournal/screens/edit_journal_entry.dart';

class JournalEntryCard extends StatelessWidget {
  final JournalEntry data;

  const JournalEntryCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(data.text),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditJournalEntry(
                      data: data,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
              ),
            )
          ],
        ),
      ),
    );
  }
}
