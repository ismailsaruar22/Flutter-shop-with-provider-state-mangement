import 'package:flutter/material.dart';
import 'package:flutter_shop_app_with_provider/screens/cart_screen.dart';
import 'package:flutter_shop_app_with_provider/widgets/app_drawer.dart';
import 'package:flutter_shop_app_with_provider/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../widgets/products_gridview.dart';
import '../providers/cart.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    //final productContainer = Provider.of<Products>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.Favorites) {
                  _showOnlyFavorite = true;
                } else {
                  _showOnlyFavorite = false;
                }
              });
            },
            itemBuilder: ((context) => [
                  const PopupMenuItem(
                    value: FilterOption.Favorites,
                    child: Text('Only Favorites'),
                  ),
                  const PopupMenuItem(
                    value: FilterOption.All,
                    child: Text('Show All'),
                  ),
                ]),
          ),
          //IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))

          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGridview(_showOnlyFavorite),
    );
  }
}
