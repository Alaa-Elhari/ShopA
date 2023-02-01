import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginin/controller/controller.dart';
import 'package:loginin/productpack/productApi.dart';
import '../productpack/product.dart';
import '../tools/categroylist.dart';
import '../tools/listproduct.dart';
import '../tools/search.dart';
import 'Signup.dart';

//pour sign out FirebaseAuth.instance.signOut();
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  Color k = Color(0XFFF5F5F5);
  late List<Product> _product;
  bool _isloading = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        shadowColor: Theme.of(context).backgroundColor,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(210, 10, 0, 0),
                child: IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    icon: Icon(Icons.menu_rounded)),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          const shi(),
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
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: searchtool(),
        ),
        SizedBox(
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
