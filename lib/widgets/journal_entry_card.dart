import 'package:flutter/material.dart';
import 'package:lernjournal/models/journal_entry.dart';

class JournalEntryCard extends StatelessWidget {
  final JournalEntry data;

  const JournalEntryCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [Text(data.text)],
    ));
  }
}
