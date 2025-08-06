import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/LoginScreens/BoardScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BoardScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          color: kBlackColor,
          image: DecorationImage(
            image: AssetImage("assets/img/w.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.35,
              width: screenWidth * 0.6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/bg.png"),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            const Text(
              "Shop Plus",
              style: kSplashScreenTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
