import 'package:doctor_ai/utlis/appColors.dart';
import 'package:doctor_ai/utlis/app_images.dart';
import 'package:doctor_ai/view/on_boarding_screen/create_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(
        () => CreateAccountScreen(),
        transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 500),
      );

      // Navigate to Home Screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            ImageAssets.splashImg, // Change the image path
            fit: BoxFit.cover,
          ),

          // Centered App Logo + Text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Image.asset(
                ImageAssets.logoImg, // Your app logo
                width: 120,
                height: 120,
              ),

              const SizedBox(height: 17), // Spacing between logo and text
              // App Name
              Text(
                "Doctor. AI",
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 11),
              // App Slogan
              Text(
                "Your Smart Health Companion",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
