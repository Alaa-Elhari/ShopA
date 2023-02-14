import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class navigation extends StatelessWidget {
  const navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.lightGreen,
              height: 80,
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed('HomeScreen'),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Search"),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed('ScreenSearch'),
            ),
            ListTile(
              leading: const Icon(Icons.qr_code_scanner_outlined),
              title: const Text("Scan"),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed('ScanProduct'),
            ),
            ListTile(
              leading: const Icon(Icons.output_sharp),
              title: const Text("Login Out"),
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      )),
    );
  }
}
