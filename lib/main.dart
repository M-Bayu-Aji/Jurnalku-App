import 'package:flutter/material.dart';
import 'package:jurnalku_app/screens/jurnal.dart';
import 'package:jurnalku_app/screens/settings.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jurnalku App',
      home: const Settings(),
    );
  }
}
