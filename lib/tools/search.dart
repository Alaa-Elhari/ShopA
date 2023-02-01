import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class searchtool extends StatelessWidget {
  const searchtool({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 209, 214, 192).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search_sharp,
                size: 30,
                color: Colors.black,
              ),
              border: InputBorder.none,
              hintText: 'Search here .',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('ScanProduct');
                    },
                    icon: Icon(
                      Icons.qr_code_scanner_rounded,
                      color: Colors.black,
                    )),
              )),
        ),
      ),
    );
  }
}
