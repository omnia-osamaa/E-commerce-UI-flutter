import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/LoginScreens/OTPVerify.dart'; // تأكد من استيراد OTPVerify
import 'package:shope_pluse/Provider/auth_provider.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: kWhiteColor,
      key: const Key('forget_screen'),
      appBar: AppBar(
        backgroundColor: kTransparentColor,
        elevation: 0,
        leading: const BackButton(color: kBlackColor),
        foregroundColor: kBlackColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
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
                controller: _emailController,
                onChanged: (val) {},
                decoration: kOutlineInputDecoration(
                  labelText: "Enter Email",
                  suffixIcon: InkWell(
                    onTap: () {
                      _emailController.clear();
                    },
                    child: const Icon(
                      CupertinoIcons.multiply,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                onPressed: authProvider.isLoading
                    ? null
                    : () async {
                        await authProvider
                            .sendPasswordResetEmail(_emailController.text);
                        if (authProvider.errorMessage == null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OTPVerifyScreen()), // الانتقال مباشرةً إلى OTPVerifyScreen
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
                        "Send Code",
                        style: kButtonTextStyle,
                      ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Or",
                      style: kOrTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        // يمكنك إضافة منطق آخر هنا إذا كنت ترغب في الانتقال إلى شاشة أخرى
                      },
                      child: const Text(
                        "Verify Using Number",
                        style: kVerifyUsingNumberTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}