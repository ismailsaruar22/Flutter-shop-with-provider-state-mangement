import 'package:flutter/material.dart';
import 'package:flutter_shop_app_with_provider/providers/cart.dart';
import 'package:flutter_shop_app_with_provider/providers/product.dart';
import 'package:flutter_shop_app_with_provider/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          leading: Consumer(
            builder: (context, value, _) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Colors.pink.shade600,
              onPressed: () {
                product.togleFavoriteStatus();
              },
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Added item to the cart,'),
                duration: const Duration(
                  seconds: 1,
                ),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    cart.removeSingleItem(product.id);
                  },
                ),
              ));
            },
          ),
        ),
        child: GestureDetector(
          onTap: (() => Navigator.pushNamed(
                context,
                ProdcutDetailsScreen.routeName,
                arguments: product.id,
              )),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
