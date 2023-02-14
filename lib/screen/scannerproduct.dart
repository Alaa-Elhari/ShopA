import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:loginin/tools/informationProduct.dart';
import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/PerSize.dart';
import 'package:openfoodfacts/model/ProductResultV3.dart';

class pagescanproduct extends StatefulWidget {
  const pagescanproduct({super.key});

  @override
  State<pagescanproduct> createState() => _pageProductState();
}

class _pageProductState extends State<pagescanproduct> {
  String? scanner;

  late ProductResultV3 product;
  var foods;
  var productdata;

  /*Future<ProductResultV3?> getdata() async {
    ProductQueryConfiguration config = ProductQueryConfiguration(
      scanner!,
      version: ProductQueryVersion.v3,
    );
    product = await OpenFoodAPIClient.getProductV3(config);
    return product;
  }*/
  Future fetchFoods() async {
    var response = await http.get(Uri.parse(
        'https://world.openfoodfacts.org/cgi/search.pl?search_terms=$scanner&search_simple=1&json=1'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        foods = data['products'];
      });
    } else {
      print('Failed to load foods');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      scanbarcode();
                    },
                    icon: const Icon(Icons.qr_code_scanner,
                        color: Colors.black, size: 20)),
                FutureBuilder(
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator.adaptive();
                    }
                    if (snapshot.hasError) {
                      return const Text(
                          "We don't this product yet or the scan was not use prople");
                    } else {
                      if (scanner == null) {
                        return const Text("please use scan ");
                      } else {
                        var productData = foods;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(productData: productData),
                          ),
                        );
                        return const Text("ok");
                      }
                    }
                  }),
                  future: fetchFoods(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future scanbarcode() async {
    String scanner;
    try {
      scanner = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      scanner = "error";
    }
    if (!mounted) return;
    setState(() => this.scanner = scanner);
  }
}

class Productimage extends StatelessWidget {
  const Productimage({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;
  final ProductResultV3 product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      height: size.width * 0.8,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Image.network(
          '${product.product?.imageFrontUrl}',
          height: size.width * 0.8,
          width: size.width * 0.8,
          fit: BoxFit.fitHeight,
        ),
        Text('${product.product?.productName}'),
        Text('${product.product?.brands}'),
        Text(
            '${product.product?.nutriments?.getValue(Nutrient.salt, PerSize.oneHundredGrams)}')
      ]),
    );
  }
}
/*  print(product.product?.productName);
      print(product.product?.brands);
      print(product.product?.quantity);
      print(product.product?.nutriments
          ?.getValue(Nutrient.salt, PerSize.oneHundredGrams));
      print(product.product?.additives?.names);
      print(product.product?.allergens?.names);
      print(product.product?.imageFrontUrl);*/
