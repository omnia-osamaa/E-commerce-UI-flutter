import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/LoginScreens/SuccsesScreen.dart';
import 'package:shope_pluse/Provider/auth_provider.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  final TextEditingController _resetCodeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _resetCodeController.dispose();
    _newPasswordController.dispose();
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
              SizedBox(height: screenHeight * 0.02),
              const Text(
                "Forget Password",
                style: kHeadingTextStyle,
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: _resetCodeController,
                obscureText: true,
                decoration: kOutlineInputDecoration(
                  labelText: "Reset Code",
                  prefixIcon: Icons.numbers,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: kOutlineInputDecoration(
                  labelText: "New Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: kOutlineInputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                onPressed: authProvider.isLoading
                    ? null
                    : () async {
                        await authProvider.setNewPassword(
                          _resetCodeController.text,
                          _newPasswordController.text,
                          _confirmPasswordController.text,
                        );
                        if (authProvider.errorMessage == null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const SuccsessScreen()),
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
            ],
          ),
        ),
      ),
    );
  }
}