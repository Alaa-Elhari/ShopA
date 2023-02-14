import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginin/tools/navigation.dart';
import '../tools/categroylist.dart';
import '../tools/listproduct.dart';
import '../tools/search.dart';

//pour sign out FirebaseAuth.instance.signOut();
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        shadowColor: Theme.of(context).backgroundColor,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Center(
            child: Row(
              children: [
                const Icon(Icons.shopping_cart_sharp),
                const SizedBox(
                  width: 10,
                ),
                Text("SHOP A",
                    style: GoogleFonts.lato(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
      drawer: const navigation(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: const [
          searchtool(),
          shi(),
          Products(),
        ],
      ),
    );
  }
}

class shi extends StatefulWidget {
  const shi({super.key});

  @override
  State<shi> createState() => _shiState();
}

class _shiState extends State<shi> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'We have everthing that you need ',
            style: GoogleFonts.acme(color: Colors.black54, fontSize: 50),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const categorylist(),
        const SizedBox(height: 20),
      ]),
    );
  }
}
