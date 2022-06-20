import 'package:flutter/material.dart';
import 'package:flutter_shop_app_with_provider/providers/cart.dart';
import 'package:flutter_shop_app_with_provider/providers/orders.dart';
import 'package:flutter_shop_app_with_provider/providers/products.dart';
import 'package:flutter_shop_app_with_provider/screens/cart_screen.dart';
import 'package:flutter_shop_app_with_provider/screens/edit_product_scree.dart';
import 'package:flutter_shop_app_with_provider/screens/orders_screen.dart';
import 'package:flutter_shop_app_with_provider/screens/product_details_screen.dart';
import 'package:flutter_shop_app_with_provider/screens/product_overview_screen.dart';
import 'package:flutter_shop_app_with_provider/screens/user_product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.light(
                primary: const Color.fromARGB(255, 46, 8, 53),
                secondary: Colors.pink.shade500),
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          ProdcutDetailsScreen.routeName: (context) => ProdcutDetailsScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routName: (context) => OrdersScreen(),
          UserProductScreen.routeName: (context) => UserProductScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
        },
      ),
    );
  }
}
