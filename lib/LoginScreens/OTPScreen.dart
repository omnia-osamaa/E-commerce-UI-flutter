import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/LoginScreens/OTPVerify.dart';
import 'package:shope_pluse/Models/viewmodels.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final authViewModel = Provider.of<AuthViewModel>(context);

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
                "Forget Password",
                style: kHeadingTextStyle,
              ),
              SizedBox(height: screenHeight * 0.03),
              const Text(
                kEnterEmailMessage,
                style: kBodyTextStyle,
              ),
              SizedBox(height: screenHeight * 0.03),
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.phone,
                decoration: kOutlineInputDecoration(
                  labelText: "Enter Number",
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                onPressed: authViewModel.isLoading
                    ? null
                    : () async {
                        authViewModel.setLoading(true);
                        await Future.delayed(const Duration(seconds: 1));
                        authViewModel.setLoading(false);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OTPVerifyScreen()),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(screenHeight * 0.07),
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: authViewModel.isLoading
                    ? const CircularProgressIndicator(color: kWhiteColor)
                    : const Text(
                        "Send Code",
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
