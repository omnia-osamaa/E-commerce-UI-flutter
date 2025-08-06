import 'package:flutter/material.dart';
import 'package:shope_pluse/Constant/Colors.dart';

// Text Styles
const TextStyle kHeadingTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

const TextStyle kSubHeadingTextStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  color: kPrimaryColor,
);

const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 15,
);

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 18,
  color: kWhiteColor,
);

const TextStyle kLinkTextStyle = TextStyle(
  fontSize: 15,
  color: kPrimaryColor,
  fontWeight: FontWeight.w800,
);

const TextStyle kOrTextStyle = TextStyle(
  fontSize: 20,
);

const TextStyle kVerifyUsingNumberTextStyle = TextStyle(
  fontSize: 20,
  color: kPrimaryColor,
  fontWeight: FontWeight.w800,
);

const TextStyle kOnboardingTitleTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w700,
);

const TextStyle kOnboardingBodyTextStyle = TextStyle(
  fontSize: 19,
);

const TextStyle kOnboardingButtonTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: kPrimaryColor,
);

const TextStyle kSplashScreenTitleStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: 30,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
);

// Input Decorations
InputDecoration kOutlineInputDecoration({
  required String labelText,
  IconData? prefixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    labelText: labelText,
    border: const OutlineInputBorder(),
    prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
    suffixIcon: suffixIcon,
  );
}
