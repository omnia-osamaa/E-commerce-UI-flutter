import 'package:flutter/material.dart';
import 'package:shope_pluse/Models/ProductModel.dart';


class CartItem {
  final Product product; 
  bool isSelected;
  int quantity;
  String? selectedSize; 
  Color? selectedColor; 

  CartItem({
    required this.product,
    this.isSelected = true,
    this.quantity = 1,
    this.selectedSize,
    this.selectedColor,
  });

  double get total => product.price * quantity;
}