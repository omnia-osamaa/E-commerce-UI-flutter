import 'package:flutter/material.dart';
import 'package:shope_pluse/Models/CartItem.dart';
import 'package:shope_pluse/Models/ProductModel.dart';


class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = []; // Start with an empty cart

  List<CartItem> get cartItems => _cartItems;

  /// Add a product to the cart or increment its quantity if it already exists
  void addProductToCart(Product product, {String? size, Color? color, required int quantity}) {
    final existingItemIndex = _cartItems.indexWhere(
      (item) => item.product.id == product.id && item.selectedSize == size && item.selectedColor == color,
    );

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity++;
    } else {
      _cartItems.add(CartItem(product: product, selectedSize: size, selectedColor: color));
    }
    notifyListeners();
  }

  /// Returns true if all items are selected
  bool get selectAll => _cartItems.isNotEmpty && _cartItems.every((item) => item.isSelected);

  /// Returns total cost of selected items
  double get totalPayment => _cartItems
      .where((item) => item.isSelected)
      .fold(0.0, (sum, item) => sum + item.total);

  /// Toggle selection of a single item
  void toggleItemSelection(int index, bool? value) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].isSelected = value ?? false;
      notifyListeners();
    }
  }

  /// Select or unselect all items
  void toggleSelectAll(bool? value) {
    final select = value ?? false;
    for (var item in _cartItems) {
      item.isSelected = select;
    }
    notifyListeners();
  }

  /// Increase quantity of item
  void incrementQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  /// Decrease quantity of item (min 1)
  void decrementQuantity(int index) {
    if (index >= 0 && index < _cartItems.length && _cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  /// Set quantity directly (e.g., from input field)
  void updateItemQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _cartItems.length && newQuantity > 0) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  /// Remove item from cart
  void removeItem(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  /// Remove all selected items
  void removeSelectedItems() {
    _cartItems.removeWhere((item) => item.isSelected);
    notifyListeners();
  }

  /// Clear all items from cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  /// Count of selected items
  int get selectedItemCount => _cartItems.where((item) => item.isSelected).length;

  /// Count of total items
  int get totalItemCount => _cartItems.length;
}