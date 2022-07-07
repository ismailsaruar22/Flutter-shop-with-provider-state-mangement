import 'package:flutter/material.dart';
import 'package:flutter_shop_app_with_provider/screens/cart_screen.dart';
import 'package:flutter_shop_app_with_provider/widgets/app_drawer.dart';
import 'package:flutter_shop_app_with_provider/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
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
  var _isInIt = true;
  var _isLoading = false;

  @override
  void initState() {
    // context can't be assigned in inIt state. So this an alternative way of useing
    //context in inIt state.But the condition is it will only work when listen: false
    // So its better to use didChangeDependencies for this purpose.

    // Future.delayed(Duration.zero).then((value) =>
    //     Provider.of<Products>(context, listen: false).fetchProducts());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInIt) {
      _isLoading = true;
      Provider.of<Products>(context).fetchProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInIt = false;
    super.didChangeDependencies();
  }

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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ProductsGridview(_showOnlyFavorite),
    );
  }
}
