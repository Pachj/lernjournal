import 'package:flutter/material.dart';
import 'package:lernjournal/providers/journal_entries.dart';
import 'package:lernjournal/screens/overview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final blub = await JournalEntries.create();
  print(blub.entries[0].text);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lernjournal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Overview(),
    );
  }
}
