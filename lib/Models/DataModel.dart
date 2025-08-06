import 'package:flutter/material.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Models/ProductModel.dart';

class AppData {
  static List<String> tabs = ["All", "Category", "Top", "Recommended"];

  static List<Product> products = [
    Product(
      id: "p1",
      image: "assets/img/boot.jpeg",
      title: "Boots",
      price: 600.0,
      reviews: 77,
      description: kRating,
      availableSizes: ["36", "37", "39", "40","41"],
      availableColors: [Colors.black, Colors.brown, Color.fromARGB(255, 242, 162, 128)],
      additionalImages: ["assets/img/boot.jpeg", "assets/img/boot1.jpeg", "assets/img/boot2.jpeg"],
    ),
    Product(
      id: "p2",
      image: "assets/img/shirt.jpeg",
      title: "Hoodie",
      price: 900.0,
      reviews: 156,
      description: kRating,
      availableSizes: ["S", "M", "L", "XL"],
      availableColors: [Colors.grey, Colors.blue, Colors.red],
      additionalImages: ["assets/img/shirt.jpeg", "assets/img/shirt1.jpeg", "assets/img/shirt2.jpeg"],
    ),
    Product(
      id: "p3",
      image: "assets/img/glass.jpeg",
      title: "Sunglasses",
      price: 430.0,
      reviews: 35,
      description: kRating,
      availableColors: [Colors.black, Colors.brown],
      additionalImages: ["assets/img/glass.jpeg", "assets/img/glass.jpeg"],
    ),
    Product(
      id: "p4",
      image: "assets/img/pants.jpeg",
      title: "Pants",
      price: 870.0,
      reviews: 197,
      description: kRating,
      availableSizes: ["28", "30", "32", "34", "36"],
      availableColors: [Colors.blueGrey, Colors.black],
      additionalImages: ["assets/img/pants.jpeg", "assets/img/pants.jpeg"],
    ),
    Product(
      id: "p5",
      image: "assets/img/watch.jpeg",
      title: "Hand Watch",
      price: 1570.0,
      reviews: 45,
      description: kRating,
      availableColors: [Colors.black, Colors.blue, Colors.red],
      additionalImages: ["assets/img/watch.jpeg", "assets/img/watch1.jpeg","assets/img/watch2.jpeg"],
    ),
    Product(
      id: "p6",
      image: "assets/img/shirt.jpeg",
      title: "Sweatshirt",
      price: 657.0,
      reviews: 257,
      description: kRating,
      availableSizes: ["S", "M", "L", "XL"],
      availableColors: [Colors.grey, Colors.black, Colors.white],
      additionalImages: ["assets/img/shirt.jpeg", "assets/img/shirt1.jpeg", "assets/img/shirt2.jpeg"],),
  ];
}