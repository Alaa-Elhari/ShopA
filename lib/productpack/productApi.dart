import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:loginin/tools/listproduct.dart';
import 'product.dart';

class ProductApi {
  static var client = http.Client();
  static Future<Product?> fetchProduct() async {
    var response = await client.get(Uri.parse(
        'https://world.openfoodfacts.org/api/v0/product/737628064502.json'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}
