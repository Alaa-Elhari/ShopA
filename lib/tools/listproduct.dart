import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:openfoodfacts/model/IngredientsAnalysisTags.dart';
import 'package:openfoodfacts/model/parameter/IngredientsAnalysisParameter.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late SearchResult result;

  Future<List<Product>?> fetchVeganProducts() async {
    ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
      parametersList: <Parameter>[
        const IngredientsAnalysisParameter(
          veganStatus: VeganStatus.VEGAN,
        ),
      ],
    );
    result = await OpenFoodAPIClient.searchProducts(
      const User(userId: 'alaaxelhari', password: '2003alaa'),
      configuration,
    );

    print("${result.products!.length}");
  }

  @override
  void initState() {
    super.initState();
    fetchVeganProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchVeganProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator.adaptive();
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Expanded(
            child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: result.products!.length,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          Image.network(
                            '${result.products?[index].imageFrontUrl}',
                          ),
                          Text('${result.products?[index].productName}'),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.rectangle))
                        ],
                      ),
                    ),
                  );
                }),
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1)),
          );
        }
      },
    );
  }
}
