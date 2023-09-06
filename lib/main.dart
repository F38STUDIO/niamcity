import 'package:flutter/material.dart';

import 'donnee_fixes/couleurs.dart';
import 'screens/main_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'niamcity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Couleurs.d),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
