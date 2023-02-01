import 'dart:convert';
import 'package:get/state_manager.dart';

import 'package:get/get.dart';
import 'package:http/http.dart ' as http;
import 'package:loginin/productpack/product.dart';
import 'package:loginin/productpack/productApi.dart';

class Controllerproduct extends GetxController {
  var Productlist = <Product>[].obs();
  var isloading = true.obs();
  void fetchdata() async {
    var product = await ProductApi.fetchProduct();
    if (product != Null) {
      Productlist = product as List<Product>;
    }
  }
}
