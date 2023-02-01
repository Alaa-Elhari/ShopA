import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  void getdata() async {
    http.Response response = await http.get(Uri.parse(
        'https://world.openfoodfacts.org/api/v0/product/737628064502.json'));
    Map data = jsonDecode(response.body);
    print(data);
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: 100,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemBuilder: ((context, index) {
            return Container(
              height: 200,
              width: 200,
              color: Colors.red,
            );
          }),
          staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
    );
  }
}
