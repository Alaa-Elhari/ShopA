import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'informationProduct.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  var foods = [];
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton.icon(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              label: Text(
                "Back",
                style: GoogleFonts.robotoSerif(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('HomeScreen');
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search for food products...',
                ),
              ),
            ),
            TextButton(
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.lightGreen),
              ),
              onPressed: () {
                fetchFoods(searchController.text);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: foods.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: foods[index]['product_name'] != null
                          ? Text(foods[index]['product_name'])
                          : null,
                      onTap: () {
                        var productData;
                        foods[index] != null
                            ? productData = foods[index]
                            : null;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(productData: productData),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fetchFoods(String searchTerm) async {
    var response = await http.get(Uri.parse(
        'https://world.openfoodfacts.org/cgi/search.pl?search_terms=$searchTerm&search_simple=1&json=1'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        foods = data['products'];
      });
    } else {
      print('Failed to load foods');
    }
  }
}
