import 'package:car_rental/core/constants/image_const.dart';
import 'package:car_rental/core/constants/text_const.dart';
import 'package:car_rental/core/theme/color_const.dart';
import 'package:car_rental/features/home/view/home.dart';
import 'package:flutter/material.dart';


class CarOnboardingPage extends StatelessWidget {
  const CarOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    return Scaffold(
      backgroundColor: ColorConst.primaryBlack,
      body: SafeArea(
        child: isLandscape
            ? _landscapeLayout(context)
            : _portraitLayout(context),
      ),
    );
  }

  /// ---------------- PORTRAIT ----------------
  Widget _portraitLayout(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        /// Image
        Expanded(
          flex: 6,
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 1.5,
              heightFactor: 1.5,
              child: Image.asset(
                ImageConst.carSplash,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        /// Content
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.03,
            ),
            child: _content(context),
          ),
        ),
      ],
    );
  }

  /// ---------------- LANDSCAPE ----------------
  Widget _landscapeLayout(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        /// Image
        Expanded(
          flex: 5,
          child: Center(
            child: Image.asset(
              ImageConst.carSplash,
              fit: BoxFit.contain,
            ),
          ),
        ),

        /// Content
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.04,
            ),
            child: _content(context),
          ),
        ),
      ],
    );
  }

  /// ---------------- SHARED CONTENT ----------------
  Widget _content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextConst.onboarding['title']!,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ColorConst.white,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          TextConst.onboarding['subtitle']!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorConst.lightWhite,
                height: 1.5,
              ),
        ),
        const Spacer(),

        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.buttonBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
            },
            child: Text(
              TextConst.onboarding['button']!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ColorConst.buttonText,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
