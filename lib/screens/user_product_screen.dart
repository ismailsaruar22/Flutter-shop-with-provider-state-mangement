import 'package:flutter/material.dart';
import 'package:flutter_shop_app_with_provider/screens/edit_product_scree.dart';
import 'package:flutter_shop_app_with_provider/widgets/app_drawer.dart';
import 'package:flutter_shop_app_with_provider/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/userProduct';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.of(context).pushNamed(
                EditProductScreen.routeName,
              );
            }),
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: (() => _refreshProducts(context)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (context, i) => Column(
              children: [
                UserProductItem(
                  imageUrl: productsData.items[i].imageUrl,
                  title: productsData.items[i].title,
                  id: productsData.items[i].id,
                ),
                const Divider(),
              ],
            ),
            itemCount: productsData.items.length,
          ),
        ),
      ),
    );
  }
}
