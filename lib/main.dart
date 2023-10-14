import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sk_admin/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          authDomain: 'sk-app-56284.firebaseapp.com',
          apiKey: "AIzaSyCRQvDJ2MT7GCd3achOLXNHd7_k1hrzcYA",
          appId: "1:549984970718:web:ec00125a2664650b36df4f",
          messagingSenderId: "549984970718",
          projectId: "sk-app-56284",
          storageBucket: "sk-app-56284.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SK ADMIN',
      home: HomeScreen(),
    );
  }
}
