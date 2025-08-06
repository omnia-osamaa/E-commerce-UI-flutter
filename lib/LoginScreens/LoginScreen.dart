import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/LoginScreens/ForgetScreen.dart';
import 'package:shope_pluse/LoginScreens/SignupScreen.dart';
import 'package:shope_pluse/LoginScreens/SuccsesScreen.dart';
import 'package:shope_pluse/Provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.06),
              const Text(
                "Welcome Back",
                style: kSubHeadingTextStyle,
              ),
              SizedBox(height: screenHeight * 0.02),
              Image.asset(
                "assets/img/loog.png",
                height: screenHeight * 0.2,
                width: screenWidth * 0.4,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Login to your account",
                textAlign: TextAlign.center,
                style: kBodyTextStyle,
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _emailController,
                decoration: kOutlineInputDecoration(
                  labelText: "Enter Email",
                  prefixIcon: Icons.email,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: kOutlineInputDecoration(
                  labelText: "Enter Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetScreen()),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: kLinkTextStyle,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              ElevatedButton(
                onPressed: authProvider.isLoading
                    ? null
                    : () async {
                        await authProvider.login(
                          _emailController.text,
                          _passwordController.text,
                        );
                        if (authProvider.errorMessage == null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuccsessScreen()),
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
                        "Login",
                        style: kButtonTextStyle,
                      ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: kBodyTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: kLinkTextStyle,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/img/facebook.png",
                      height: screenHeight * 0.05),
                  SizedBox(width: screenWidth * 0.05),
                  Image.asset("assets/img/instagram.png",
                      height: screenHeight * 0.05),
                  SizedBox(width: screenWidth * 0.05),
                  Image.asset("assets/img/whatsapp.png",
                      height: screenHeight * 0.05),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
