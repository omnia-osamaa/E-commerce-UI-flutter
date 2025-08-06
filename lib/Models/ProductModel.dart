import 'package:flutter/material.dart';

class Product {
  final String id;
  final String image;
  final String title;
  final double price;
  final int reviews;
  final String description;
  final List<String> availableSizes;
  final List<Color> availableColors;
  final List<String> additionalImages;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.reviews,
    this.description = "",
    this.availableSizes = const [],
    this.availableColors = const [],
    this.additionalImages = const [],
  });
}