import 'package:flutter/material.dart';
import 'package:flutter_shop_app_with_provider/providers/products.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductsGridview extends StatelessWidget {
  bool showFavs;
  ProductsGridview(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoritesItem : productsData.items;
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        //Note : its better to use ChangeNotifierProvider.value for grid and lists
        value: products[i],
        //create: (context) => products[i],
        child: ProductItem(),
      ),
    );
  }
}
