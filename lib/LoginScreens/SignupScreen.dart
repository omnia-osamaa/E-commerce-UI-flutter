import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/LoginScreens/LoginScreen.dart';
import 'package:shope_pluse/LoginScreens/SuccsesScreen.dart';
import 'package:shope_pluse/Provider/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                "Register Account",
                style: kSubHeadingTextStyle,
              ),
              SizedBox(height: screenHeight * 0.02),
              Image.asset(
                "assets/img/loog.png",
                height: screenHeight * 0.2,
                width: screenWidth * 0.4,
              ),
              SizedBox(height: screenHeight * 0.015),
              Text(
                "Complete Details",
                textAlign: TextAlign.center,
                style: kBodyTextStyle,
              ),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: _nameController,
                decoration: kOutlineInputDecoration(
                  labelText: "Enter Name",
                  prefixIcon: Icons.person,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
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
                obscureText: !_isPasswordVisible,
                decoration: kOutlineInputDecoration(
                  labelText: "Enter Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: kOutlineInputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              ElevatedButton(
                onPressed: authProvider.isLoading
                    ? null
                    : () async {
                        await authProvider.signUp(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                          _confirmPasswordController.text,
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
                        "Create Account",
                        style: kButtonTextStyle,
                      ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: kBodyTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Login",
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
