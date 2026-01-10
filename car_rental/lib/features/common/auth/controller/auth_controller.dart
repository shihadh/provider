import 'package:flutter/material.dart';

enum LoginStatus { success, failed }

class AuthController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isLoading = false;

  static const _tempEmail = 'car@gmail.com';
  static const _tempPassword = '123';

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  Future<LoginStatus> login() async {
    if (!formKey.currentState!.validate()) {
      return LoginStatus.failed;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    isLoading = false;
    notifyListeners();

    if (email == _tempEmail && password == _tempPassword) {
      return LoginStatus.success;
    } else {
      return LoginStatus.failed;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
