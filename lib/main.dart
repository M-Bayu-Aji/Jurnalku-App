import 'package:flutter/material.dart';
import 'package:jurnalku_app/screens/dashboard.dart';
import 'package:jurnalku_app/screens/profile.dart';
import 'package:jurnalku_app/screens/progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jurnalku App',
      home: const Profile(),
    );
  }
}
