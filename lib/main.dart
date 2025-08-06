import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/HomeScreens/NavigatorScreen.dart';
import 'package:shope_pluse/Provider/auth_provider.dart';
import 'package:shope_pluse/Provider/cart_provider.dart';
import 'package:shope_pluse/Provider/favorite_provider.dart';
import 'package:shope_pluse/Provider/payment_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MaterialApp(
        title: 'Shop Plus',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 87, 62, 182),
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
        ),
        home: const NavigationScreen(),
      ),
    );
  }
}
