import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lernjournal/models/journal_entry.dart';
import 'package:lernjournal/providers/journal_entries.dart';
import 'package:lernjournal/widgets/journal_entry_card.dart';

import 'edit_journal_entry.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  late Future<JournalEntries> _journalEntries;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() {
      _journalEntries = JournalEntries.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditJournalEntry(
                data: JournalEntry(
                    text: '',
                    timestamp: Timestamp.fromDate(
                      DateTime.now(),
                    ),
                    id: ''),
              ),
            ),
          );
          // refetch data after navigator pop
          fetchData();
        },
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
                  return JournalEntryCard(
                    data: snapshot.data!.entries[index],
                    fetchData: fetchData,
                  );
                },
              );
            }
          }),
    );
  }
}
