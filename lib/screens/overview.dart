import 'package:flutter/material.dart';
import 'package:lernjournal/providers/journal_entries.dart';
import 'package:lernjournal/widgets/journal_entry_card.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  final Future<JournalEntries> _journalEntries = JournalEntries.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: _journalEntries,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.entries.length,
                itemBuilder: (context, index) {
                  return JournalEntryCard(data: snapshot.data!.entries[index]);
                },
              );
            }
          }),
    );
  }
}
