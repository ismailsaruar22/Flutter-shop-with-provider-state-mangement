import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop_app_with_provider/models/http_exception.dart';
import 'package:flutter_shop_app_with_provider/models/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Product 1',
    //   description: 'This is prodcut 1',
    //   price: 30.0,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Product 2',
    //   description: 'This is prodcut 2',
    //   price: 30.0,
    //   imageUrl:
    //       'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Product 3',
    //   description: 'This is prodcut 3',
    //   price: 30.0,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1099&q=80',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'Product 4',
    //   description:
    //       'This is prodcut 4, I don\'t know what to write in this description',
    //   price: 30.0,
    //   imageUrl:
    //       'https://productionservices.jumia.co.ke/wp-content/uploads/2018/01/product1.jpeg',
    // ),
    // Product(
    //   id: 'p5',
    //   title: 'Product 5',
    //   description: 'This is prodcut 5',
    //   price: 30.0,
    //   imageUrl:
    //       'https://expertphotography.b-cdn.net/wp-content/uploads/2019/07/photography-lenses-oranges.jpg',
    // ),
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
  Future<void> fetchProducts() async {
    final url = Uri.parse(
        'https://shop-app-71a88-default-rtdb.firebaseio.com/products.json');
    try {
      final response = await http.get(url);
      final receivedData = json.decode(response.body);
      if (receivedData == null) {
        return;
      }
      final List<Product> loadedProducts = [];
      final extractedData = receivedData as Map<String, dynamic>;

      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite: prodData['isFavorite'],
          imageUrl: prodData['imageUrl'],
        ));
        _items = loadedProducts;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        'https://shop-app-71a88-default-rtdb.firebaseio.com/products.json');

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavorite,
        }),
      );

      final newProduct = Product(
        id: jsonDecode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateProduct(String id, Product newProdut) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    final url = Uri.parse(
        'https://shop-app-71a88-default-rtdb.firebaseio.com/products/$id.json');
    if (prodIndex >= 0) {
      await http.patch(url,
          body: json.encode({
            'title': newProdut.title,
            'description': newProdut.description,
            'imageUrl': newProdut.imageUrl,
            'price': newProdut.price,
          }));
      _items[prodIndex] = newProdut;
      notifyListeners();
    } else {
      print('excecuting update product');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.parse(
        'https://shop-app-71a88-default-rtdb.firebaseio.com/products/$id.json');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete it');
    }
    // existingProduct = null as Product;
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
