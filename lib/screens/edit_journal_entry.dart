import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:flutter/material.dart';
import 'package:lernjournal/models/journal_entry.dart';
import 'package:lernjournal/services/requests.dart';

class EditJournalEntry extends StatefulWidget {
  final JournalEntry data;

  const EditJournalEntry({required this.data, super.key});

  @override
  State<EditJournalEntry> createState() => _EditJournalEntryState();
}

class _EditJournalEntryState extends State<EditJournalEntry> {
  final TextEditingController _textController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.data.text;
    _selectedDate = widget.data.dateAsDateTime;
  }

  void createOrUpdate() {
    final JournalEntry journalEntry = JournalEntry(
        text: _textController.text,
        timestamp: Timestamp.fromDate(_selectedDate),
        id: widget.data.id);

    if (widget.data.id == "") {
      Requests.create(journalEntry: journalEntry);
    } else {
      Requests.update(journalEntry: journalEntry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${_selectedDate.day}.${_selectedDate.month}.${_selectedDate.year}'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => createOrUpdate(),
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                    '${_selectedDate.day}.${_selectedDate.month}.${_selectedDate.year}'),
                ElevatedButton(
                  child: const Text('Select date'),
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    );
                    if (newDate == null) return;

                    setState(() => _selectedDate = newDate);
                  },
                ),
              ],
            ),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Text',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
