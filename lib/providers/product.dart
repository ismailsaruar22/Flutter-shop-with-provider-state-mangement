import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  bool isAddedToCart;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.isAddedToCart = false,
  });

  void togleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void togleCartStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
