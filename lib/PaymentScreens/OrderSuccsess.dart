import 'package:flutter/material.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/containerBoxbutton.dart';
import 'package:shope_pluse/HomeScreens/NavigatorScreen.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
      color: kWhiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/img/confirm.png",
                height: screenHeight * 0.3,
                width: screenWidth * 0.6,
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                "Success!",
                style: TextStyle(
                  fontSize: screenWidth * 0.1,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Text(
                "Your order will be delivered from 2-7 days",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor,
                ),
              ),
              Text(
                "Thank you! for choosing our app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.04),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.largePadding),
            child: ContainerButton(
              containerWidth: screenWidth,
              itext: "Complete Shopping",
              bgColor: kPrimaryColor,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
