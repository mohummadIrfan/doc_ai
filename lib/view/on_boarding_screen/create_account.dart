import 'package:doctor_ai/utlis/appColors.dart';
import 'package:doctor_ai/utlis/app_images.dart';
import 'package:doctor_ai/utlis/app_textStyle.dart';
import 'package:doctor_ai/view/on_boarding_screen/loginPage.dart';
import 'package:doctor_ai/view/widgets/custom_app_bar.dart';
import 'package:doctor_ai/view/widgets/custom_button2.dart';
import 'package:doctor_ai/view/widgets/custom_divider.dart';
import 'package:doctor_ai/view/widgets/custom_elevated_button.dart';
import 'package:doctor_ai/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leadingImage: ImageAssets.arrowIcon,
        showSlider: true, // Enable slider
        sliderMin: 0,
        sliderMax: 100,
        sliderValue: 5,
        onSliderChanged: (value) {
          print("Slider Value: $value");
        },
        childrenItems: [
          {"image": ImageAssets.flagIcon, "text": "EN"},
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w), // Responsive padding
          child: Column(
            children: [
              SizedBox(height: 47.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Create an account",
                  style: AppTextStyles.headline1,
                ),
              ),
              SizedBox(height: 19.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Create your account",
                  style: AppTextStyles.headline2,
                ),
              ),
              SizedBox(height: 41.h),
              CustomTextField(
                hintText: "Enter email here",
                fillColor: AppColors.textFieldColor,
                onTapSuffixIcon: () {
                  print("Suffix icon tapped!");
                },
                onChanged: (value) {
                  print("Text changed: $value");
                },
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hintText: "Enter your password",
                fillColor: AppColors.textFieldColor,
                suffixImage: ImageAssets.passwordIcon,
                onTapSuffixIcon: () {
                  print("Suffix icon tapped!");
                },
                onChanged: (value) {
                  print("Text changed: $value");
                },
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                obscureText: true,
                fillColor: AppColors.textFieldColor,
                hintText: "Enter your confirm password",
                suffixImage: ImageAssets.hidepassIcon,
                onTapSuffixIcon: () {
                  print("Suffix icon tapped!");
                },
                onChanged: (value) {
                  print("Text changed: $value");
                },
              ),
              SizedBox(height: 30.h),
              CustomElevatedButton(
                text: "Create an Account",
                onPressed: () {
                  print("Create Account Clicked");
                },
              ),
              SizedBox(height: 30.h),
              CustomOrDivider(),
              SizedBox(height: 30.h),
              CustomElevatedButton(
                iconImage: ImageAssets.googleIcon,
                backgroundColor: AppColors.black,
                text: "Sign with Google",
                textColor: AppColors.white,
                onPressed: () {
                  print("Google Sign-in Clicked");
                },
              ),
              SizedBox(height: 20.h),
              CustomBorderButton(
                iconImage: ImageAssets.appleIcon,
                text: "Sign In With Apple",
                onPressed: () {
                  print("Apple Sign-in Clicked!");
                },
                backgroundColor: AppColors.white,
                borderColor: AppColors.black,
                textColor: AppColors.black,
                borderRadius: 20.r, // Responsive border radius
              ),
              SizedBox(height: 26.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppTextStyles.altextText,
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => LoginScreen(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 500),
                      );
                      print("Login Clicked!");
                    },
                    child: Text(
                      "Login",
                      style: AppTextStyles.loginText.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.black,
                        decorationThickness: 1.5,
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
  }
}
