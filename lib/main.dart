import 'package:flutter/material.dart';
import 'package:jurnalku_app/screens/explore.dart';
import 'package:jurnalku_app/screens/home.dart';
import 'package:jurnalku_app/screens/login.dart';
import 'package:jurnalku_app/screens/permintaan_saksi.dart';
import 'package:jurnalku_app/screens/progress.dart';
import 'package:jurnalku_app/screens/settings.dart';
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
        "/": (context) => const Home(),
        "/login": (context) => const Login(),
        "/dashboard": (context) => const Home(),
        "/profile": (context) => const Home(),
        "/explore": (context) => const Explore(),
        "/jurnal-pembiasaan": (context) => const Home(),
        "/permintaan-saksi": (context) => const PermintaanSaksi(),
        "/progress-siswa": (context) => const Progress(),
        "/catatan-sikap": (context) => const Home(),
        "/user-guide": (context) => const UserGuideScreen(),
        "/settings": (context) => const Settings(),
      },
    );
  }
}
