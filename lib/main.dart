import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/ui/auth/accept_screen.dart';
import 'src/ui/home_screen/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "todo app",
      theme: ThemeData(
        primaryColor: Colors.greenAccent[700],
      ),
      home:  AcceptScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

