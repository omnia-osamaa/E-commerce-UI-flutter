import 'package:flutter/material.dart';
import 'package:shope_pluse/Models/FavModel.dart';
import 'package:shope_pluse/Models/ProductModel.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<FavoriteItem> _favoriteItems = []; // Start with an empty list

  List<FavoriteItem> get favoriteItems => _favoriteItems;

  void addOrRemoveFavorite(Product product) {
    final index = _favoriteItems.indexWhere(
        (favItem) => favItem.product.id == product.id);
    if (index != -1) {
      _favoriteItems.removeAt(index);
    } else {
      _favoriteItems.add(FavoriteItem(product: product));
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favoriteItems.any(
        (favItem) => favItem.product.id == product.id);
  }

  void removeItem(int index) {
    if (index >= 0 && index < _favoriteItems.length) {
      _favoriteItems.removeAt(index);
      notifyListeners();
    }
  }
}