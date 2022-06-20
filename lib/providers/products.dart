import 'package:flutter/material.dart';
import 'package:flutter_shop_app_with_provider/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Product 1',
      description: 'This is prodcut 1',
      price: 30.0,
      imageUrl:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
    Product(
      id: 'p2',
      title: 'Product 2',
      description: 'This is prodcut 2',
      price: 30.0,
      imageUrl:
          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg',
    ),
    Product(
      id: 'p3',
      title: 'Product 3',
      description: 'This is prodcut 3',
      price: 30.0,
      imageUrl:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1099&q=80',
    ),
    Product(
      id: 'p4',
      title: 'Product 4',
      description:
          'This is prodcut 4, I don\'t know what to write in this description',
      price: 30.0,
      imageUrl:
          'https://productionservices.jumia.co.ke/wp-content/uploads/2018/01/product1.jpeg',
    ),
    Product(
      id: 'p5',
      title: 'Product 5',
      description: 'This is prodcut 5',
      price: 30.0,
      imageUrl:
          'https://expertphotography.b-cdn.net/wp-content/uploads/2019/07/photography-lenses-oranges.jpg',
    ),
  ];

  //var _showFavoritesOnly = false;

  List<Product> get items {
    //this method is for entire app wise filtering

    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoritesItem {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showALl() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
