import 'dart:async';
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
  final TextEditingController _otpController = TextEditingController();
  late Timer _timer;
  int _secondsRemaining = 60;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 60;
    _isResendEnabled = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        setState(() {
          _isResendEnabled = true;
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  BoxDecoration _pinPutDecoration(BuildContext context) {
    return BoxDecoration(
      color: kWhiteColor,
      border: Border.all(color: kPrimaryColor, width: 1.5),
      borderRadius: BorderRadius.circular(12),
    );
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
            children: [
              SizedBox(height: screenHeight * 0.02),
              Icon(Icons.lock_outline, size: 70, color: kPrimaryColor),
              SizedBox(height: screenHeight * 0.02),

              const Text(
                "OTP Verification",
                style: kHeadingTextStyle,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: screenHeight * 0.015),

              const Text(
                "A verification code has been sent to your email.",
                style: kBodyTextStyle,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: screenHeight * 0.05),

              // OTP Input
              TextFieldPin(
                textController: _otpController,
                autoFocus: true,
                codeLength: 4,
                alignment: MainAxisAlignment.center,
                defaultBoxSize: screenWidth * 0.13,
                margin: screenWidth * 0.025,
                selectedBoxSize: screenWidth * 0.13,
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                defaultDecoration: _pinPutDecoration(context).copyWith(
                  border: Border.all(color: kGreyColor),
                ),
                selectedDecoration: _pinPutDecoration(context),
                onChange: (code) {
                  setState(() {}); // Live update for input
                },
              ),

              SizedBox(height: screenHeight * 0.02),

              // Timer
              Text(
                _isResendEnabled
                    ? "Didn't get the code?"
                    : "Resend code in $_secondsRemaining sec",
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),

              // Resend Button
              

              SizedBox(height: screenHeight * 0.04),

              // Verify Button
              ElevatedButton(
                onPressed: authProvider.isLoading
                    ? null
                    : () async {
                        await authProvider.verifyOTP(_otpController.text);
                        if (authProvider.errorMessage == null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const RecoveryScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(authProvider.errorMessage!)),
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(screenHeight * 0.065),
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: authProvider.isLoading
                    ? const CircularProgressIndicator(color: kWhiteColor)
                    : const Text("Verify OTP", style: kButtonTextStyle),
              ),

              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
