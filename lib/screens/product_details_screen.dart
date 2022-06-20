import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProdcutDetailsScreen extends StatelessWidget {
  // final String title;
  // final double price;
  // const ProdcutDetailsScreen({required this.title , this.price});
  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Text(
            loadedProduct.title,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                color: Colors.pink.shade900),
          ),
          Container(
            child: Image.network(loadedProduct.imageUrl),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$${loadedProduct.price}',
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            loadedProduct.description,
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
