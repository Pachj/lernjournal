import 'package:flutter/material.dart';
import 'package:lernjournal/screens/overview.dart';

void main() {
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
