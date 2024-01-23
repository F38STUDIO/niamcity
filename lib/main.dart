import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:niamcity/firebase_options.dart';
import 'donnee_fixes/couleurs.dart';
import 'screens/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainPage(),
    );
  }
}
