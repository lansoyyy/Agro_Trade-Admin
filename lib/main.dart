import 'package:agro_trade_admin/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyB_ODLsMzG0iBeajUF95AtM6XmkhszIs1I",
    appId: "1:1013156330053:web:c98577c5d2f42648ac012c",
    messagingSenderId: "1013156330053",
    projectId: "agrotrade-69e23",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Agro Trade',
      home: HomeScreen(),
    );
  }
}
