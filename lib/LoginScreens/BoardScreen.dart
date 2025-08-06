import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/LoginScreens/LoginScreen.dart';

class BoardScreen extends StatelessWidget {
  BoardScreen({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final pageDecoration = PageDecoration(
      titleTextStyle: kOnboardingTitleTextStyle,
      bodyTextStyle: kOnboardingBodyTextStyle,
      bodyPadding: EdgeInsets.fromLTRB(
        screenWidth * 0.04,
        0,
        screenWidth * 0.04,
        screenHeight * 0.02,
      ),
      pageColor: kWhiteColor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: kWhiteColor,
      pages: [
        PageViewModel(
          title: "Shop Now",
          body: kShopNowBody,
          image: Image.asset("assets/img/a.png", width: screenWidth * 0.5),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Big Discount",
          body: kBigDiscountBody,
          image: Image.asset("assets/img/b.png", width: screenWidth * 0.5),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Free Ship",
          body: kFreeShipBody,
          image: Image.asset("assets/img/delv.png", width: screenWidth * 0.5),
          decoration: pageDecoration,
          footer: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
              top: screenHeight * 0.06,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                "Let's Shop",
                style: kButtonTextStyle,
              ),
            ),
          ),
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      back: const Text(
        "Back",
        style: kOnboardingButtonTextStyle,
      ),
      next: const Text(
        "Next",
        style: kOnboardingButtonTextStyle,
      ),
      onDone: () {},
      onSkip: () {},
      dotsDecorator: DotsDecorator(
        size: const Size.square(10),
        activeSize: const Size(20, 10),
        activeColor: kPrimaryColor,
        color: kPrimaryColor,
        spacing: const EdgeInsets.symmetric(horizontal: 3),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
