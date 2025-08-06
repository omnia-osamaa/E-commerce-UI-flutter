import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    setLoading(true);
    setErrorMessage(null);
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (email == "omnia@gmail.com" && password == "123456") {
        print("Login successful!");
      } else {
        setErrorMessage("Invalid email or password.");
      }
    } catch (e) {
      setErrorMessage("An error occurred: ${e.toString()}");
    } finally {
      setLoading(false);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    setLoading(true);
    setErrorMessage(null);
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (email.contains("@")) {
        print("Password reset email sent to $email");
      } else {
        setErrorMessage("Please enter a valid email address.");
      }
    } catch (e) {
      setErrorMessage("An error occurred: ${e.toString()}");
    } finally {
      setLoading(false);
    }
  }

  Future<void> verifyOTP(String otp) async {
    setLoading(true);
    setErrorMessage(null);
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (otp == "1234") {
        print("OTP verified successfully!");
      } else {
        setErrorMessage("Invalid OTP.");
      }
    } catch (e) {
      setErrorMessage("An error occurred: ${e.toString()}");
    } finally {
      setLoading(false);
    }
  }

  Future<void> setNewPassword(
      String resetCode, String newPassword, String confirmPassword) async {
    setLoading(true);
    setErrorMessage(null);
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (newPassword == confirmPassword && newPassword.length >= 6) {
        print("Password reset successfully!");
      } else {
        setErrorMessage("Passwords do not match or are too short.");
      }
    } catch (e) {
      setErrorMessage("An error occurred: ${e.toString()}");
    } finally {
      setLoading(false);
    }
  }

  Future<void> signUp(String name, String email, String password,
      String confirmPassword) async {
    setLoading(true);
    setErrorMessage(null);
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password == confirmPassword && password.length >= 6) {
        print("Account created successfully!");
      } else {
        setErrorMessage("Passwords do not match or are too short.");
      }
    } catch (e) {
      setErrorMessage("An error occurred: ${e.toString()}");
    } finally {
      setLoading(false);
    }
  }
}