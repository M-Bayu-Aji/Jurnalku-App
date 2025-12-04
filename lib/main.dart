import 'package:flutter/material.dart';
import 'package:jurnalku_app/screens/dashboard.dart';
import 'package:jurnalku_app/screens/explore.dart';
import 'package:jurnalku_app/screens/jurnal.dart';
import 'package:jurnalku_app/screens/login.dart';
import 'package:jurnalku_app/screens/permintaan_saksi.dart';
import 'package:jurnalku_app/screens/profile/profile.dart';
import 'package:jurnalku_app/screens/progress.dart';
import 'package:jurnalku_app/screens/settings.dart';
import 'package:jurnalku_app/screens/studentbehaviour.dart';
import 'package:jurnalku_app/screens/user_guide.dart';

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
      initialRoute: '/',
      routes: {
        "/": (context) => const Dashboard(),
        "/login": (context) => const Login(),
        "/dashboard": (context) => const Dashboard(),
        "/profile": (context) => const ProfileScreen(),
        "/explore": (context) => const Explore(),
        "/jurnal-pembiasaan": (context) => const Jurnal(),
        "/permintaan-saksi": (context) => const PermintaanSaksi(),
        "/progress-siswa": (context) => const Progress(),
        "/catatan-sikap": (context) => const Studentbehaviour(),
        "/user-guide": (context) => const UserGuideScreen(),
        "/settings": (context) => const Settings(),
      },
    );
  }
}
