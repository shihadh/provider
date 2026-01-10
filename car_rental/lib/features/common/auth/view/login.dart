import 'package:car_rental/core/constants/image_const.dart';
import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/common/auth/controller/auth_controller.dart';
import 'package:car_rental/features/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final imageHeight = isSmallScreen ? size.height * 0.40 : size.height * 0.50;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConst.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    // Background Image
                    SizedBox(
                      height: imageHeight,
                      width: double.infinity,
                      child: Image.asset(
                        ImageConst.carSplash,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Dark Overlay
                    Container(
                      height: imageHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorConst.primaryBlack.withOpacity(0.35),
                            ColorConst.primaryBlack.withOpacity(0.85),
                          ],
                        ),
                      ),
                    ),

                    //Title on Image
                    Positioned(
                      left: isSmallScreen ? 24 : 48,
                      right: isSmallScreen ? 24 : 48,
                      top: imageHeight * 0.62,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextConst.login['title']!,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 30 : 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            TextConst.login['subtitle']!,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 16 : 20,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Form Content
                    Column(
                      children: [
                        SizedBox(height: imageHeight * 0.85),

                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: isSmallScreen ? 24 : 48,
                              vertical: 24,
                            ),
                            decoration: const BoxDecoration(
                              color: ColorConst.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Consumer<AuthController>(
                              builder: (context, provider, _) {
                                return Form(
                                  key: provider.formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 30),

                                      /// Email
                                      _label(TextConst.login['emailLabel']!),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                        controller: provider.emailController,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Email is required';
                                          }
                                          return null;
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: _inputDecoration(
                                          hint: TextConst.login['emailHint']!,
                                          icon: Icons.email_outlined,
                                        ),
                                      ),

                                      const SizedBox(height: 24),

                                      /// Password
                                      _label(TextConst.login['passwordLabel']!),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                        controller: provider.passwordController,
                                        obscureText:
                                            !provider.isPasswordVisible,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Password is required';
                                          }
                                          return null;
                                        },
                                        decoration: _inputDecoration(
                                          hint:
                                              TextConst.login['passwordHint']!,
                                          icon: Icons.lock_outline,
                                          suffix: IconButton(
                                            icon: Icon(
                                              provider.isPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                            onPressed: provider
                                                .togglePasswordVisibility,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      /// Forgot password
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            TextConst.login['forgotPassword']!,
                                            style: const TextStyle(
                                              color: ColorConst.primaryBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 24),

                                      /// Login Button
                                      SizedBox(
                                        width: double.infinity,
                                        height: isSmallScreen ? 52 : 56,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorConst.primaryBlack,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                          ),
                                          onPressed: provider.isLoading
                                              ? null
                                              : () async {
                                                  final result = await provider
                                                      .login();

                                                  if (!context.mounted) return;

                                                  if (result ==
                                                      LoginStatus.success) {
                                                   

                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          'Login successful',
                                                        ),
                                                        backgroundColor:
                                                            Colors.green,
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                      ),
                                                    );
                                                     Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomeScreen(),
                                                      ),
                                                    );
                                                   
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          'Invalid email or password',
                                                        ),
                                                        backgroundColor:
                                                            Colors.redAccent,
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                      ),
                                                    );
                                                  }
                                                },
                                          child: provider.isLoading
                                              ? const SizedBox(
                                                  width: 22,
                                                  height: 22,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        color: ColorConst
                                                            .primaryBlack,
                                                      ),
                                                )
                                              : Text(
                                                  TextConst
                                                      .login['loginButton']!,
                                                  style: TextStyle(
                                                    fontSize: isSmallScreen
                                                        ? 16
                                                        : 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorConst.white,
                                                  ),
                                                ),
                                        ),
                                      ),

                                      const SizedBox(height: 32),

                                      /// Sign up
                                      Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              TextConst.login['noAccount']!,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // Navigate to signup
                                              },
                                              child: Text(
                                                TextConst.login['signUp']!,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔹 Input Decoration
  static InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      suffixIcon: suffix,
      filled: true,
      fillColor: ColorConst.primaryColor,
      prefixIconColor: ColorConst.grey,
      suffixIconColor: ColorConst.grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  static Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    );
  }
}
