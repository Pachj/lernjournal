import 'package:flutter/material.dart';
import 'package:lernjournal/models/journal_entry.dart';
import 'package:lernjournal/screens/edit_journal_entry.dart';

class JournalEntryCard extends StatelessWidget {
  final JournalEntry data;
  final Function fetchData;

  const JournalEntryCard(
      {required this.data, required this.fetchData, super.key});

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
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditJournalEntry(
                      data: data,
                    ),
                  ),
                );
                // refetch data after pop
                fetchData();
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
