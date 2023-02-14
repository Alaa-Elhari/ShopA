import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, this.productData}) : super(key: key);

  final Map<String, dynamic>? productData;

  Future<Object?> waitdata() async {
    return productData;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: waitdata(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightGreen,
                title: Text("${productData!['product_name']}"),
              ),
              body: Column(
                children: [
                  Productimage(size: size, productData: productData),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("NAME : ${productData!['product_name']}"),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }));
  }
}

class Productimage extends StatelessWidget {
  const Productimage({
    Key? key,
    required this.size,
    required this.productData,
  }) : super(key: key);

  final Size size;
  final Map<String, dynamic>? productData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 50),
        height: size.width * 0.8,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: size.width * 0.8,
              width: size.width * 0.8,
              decoration: const BoxDecoration(
                  color: Colors.lightGreen, shape: BoxShape.circle),
            ),
            ClipOval(
              child: Image.network(
                '${productData!['image_front_small_url']}',
                height: size.width * 0.8,
                width: size.width * 0.8,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
