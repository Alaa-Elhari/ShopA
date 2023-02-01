import 'package:flutter/material.dart';
import 'package:loginin/screen/Home_Screen.dart';
import 'package:loginin/screen/Signup.dart';
import 'package:loginin/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginin/screen/scannerproduct.dart';

import 'Auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Screen());
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SHOP A",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Colors.black,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black))),
      routes: {
        '/': (context) => const Auth(),
        'HomeScreen': (context) => const HomeScreen(),
        'signupScreen': (context) => const Signup(),
        'loginScreen': (context) => const login_screen(),
        'ScanProduct': (context) => scan()
      },
    );
  }
}
