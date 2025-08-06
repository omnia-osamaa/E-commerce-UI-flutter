import 'package:flutter/material.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/HomeScreens/NavigatorScreen.dart';

class SuccsessScreen extends StatelessWidget {
  const SuccsessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparentColor,
        elevation: 0,
        leading: const BackButton(color: kBlackColor),
        foregroundColor: kBlackColor,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: screenHeight * 0.15,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Success!",
                style: kHeadingTextStyle.copyWith(color: Colors.green),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Your action was completed successfully.",
                textAlign: TextAlign.center,
                style: kBodyTextStyle,
              ),
              SizedBox(height: screenHeight * 0.05),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(screenHeight * 0.07),
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Go to Home Screen",
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
