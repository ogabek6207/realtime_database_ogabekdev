import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/ui/auth/sign_up_screen.dart';
import 'src/ui/main_screen.dart';
import 'src/ui/other_user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        platform: TargetPlatform.iOS,
      ),
      home:  const MainScreen(),
      debugShowCheckedModeBanner: false,
      color: Colors.indigo[900],
    );
  }
}
