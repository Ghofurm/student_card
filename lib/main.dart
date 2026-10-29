import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'theme/app_theme.dart';

void main() => runApp(const StudentCardApp());

class StudentCardApp extends StatelessWidget {
  const StudentCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartu Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (_) => const HomePage(),
        ProfilePage.route: (_) => const ProfilePage(),
        AboutPage.route: (_) => const AboutPage(),
      },
    );
  }
}
