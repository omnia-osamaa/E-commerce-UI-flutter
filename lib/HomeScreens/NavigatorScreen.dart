import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/HomeScreens/CartSCreen.dart';
import 'package:shope_pluse/HomeScreens/FavScreen.dart';
import 'package:shope_pluse/HomeScreens/HomeScreen.dart';
import 'package:shope_pluse/HomeScreens/Profile.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var _page = 0;
  final pages = [
    HomeScreen(),
    CartScreen(),
    FavScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        color: kPrimaryColor,
        backgroundColor: kWhiteColor,
        buttonBackgroundColor: kPrimaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: [
          Icon(Icons.home, color: kWhiteColor),
          Icon(Icons.shopping_cart, color: kWhiteColor),
          Icon(Icons.favorite, color: kWhiteColor),
          Icon(Icons.person, color: kWhiteColor),
        ],
      ),
      body: pages[_page],
    );
  }
}
