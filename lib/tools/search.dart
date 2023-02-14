import 'package:flutter/material.dart';

class searchtool extends StatelessWidget {
  const searchtool({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 209, 214, 192).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(children: [
          TextButton.icon(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: (() {
              Navigator.of(context).pushReplacementNamed('ScreenSearch');
            }),
            label: const Text("Search for food products..."),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('ScanProduct');
              },
              icon: const Icon(
                Icons.qr_code_scanner_rounded,
                color: Colors.black,
              )),
        ]),
      ),
    );
  }
}
