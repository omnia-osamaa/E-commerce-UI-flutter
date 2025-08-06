import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/LoginScreens/RecoveryScreen.dart';
import 'package:shope_pluse/Provider/auth_provider.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  TextEditingController _otpController = TextEditingController(text: "");

  BoxDecoration _pinPutDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kTransparentColor,
        elevation: 0,
        leading: const BackButton(color: kBlackColor),
        foregroundColor: kBlackColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              const Text(
                "Enter OTP",
                style: kHeadingTextStyle,
              ),
              SizedBox(height: screenHeight * 0.03),
              const Text(
                "A verification code has been sent to your email.",
                style: kBodyTextStyle,
              ),
              SizedBox(height: screenHeight * 0.03),
              TextFieldPin(
                textController: _otpController,
                autoFocus: true,
                codeLength: 4,
                alignment: MainAxisAlignment.center,
                defaultBoxSize: screenWidth * 0.12,
                margin: screenWidth * 0.024,
                selectedBoxSize: screenWidth * 0.11,
                textStyle: const TextStyle(fontSize: 16),
                defaultDecoration: _pinPutDecoration(context).copyWith(
                  border: Border.all(color: kGreyColor),
                ),
                selectedDecoration: _pinPutDecoration(context),
                onChange: (code) {},
              ),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                onPressed: authProvider.isLoading
                    ? null
                    : () async {
                        await authProvider.verifyOTP(_otpController.text);
                        if (authProvider.errorMessage == null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RecoveryScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(authProvider.errorMessage!)),
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(screenHeight * 0.07),
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: authProvider.isLoading
                    ? const CircularProgressIndicator(color: kWhiteColor)
                    : const Text(
                        "Verify",
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
