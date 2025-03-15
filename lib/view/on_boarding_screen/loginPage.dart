import 'package:doctor_ai/utlis/appColors.dart';
import 'package:doctor_ai/utlis/app_images.dart';
import 'package:doctor_ai/utlis/app_textStyle.dart';
import 'package:doctor_ai/view/on_boarding_screen/create_account.dart';
import 'package:doctor_ai/view/widgets/custom_app_bar.dart';
import 'package:doctor_ai/view/widgets/custom_button2.dart';
import 'package:doctor_ai/view/widgets/custom_divider.dart';
import 'package:doctor_ai/view/widgets/custom_elevated_button.dart';
import 'package:doctor_ai/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leadingImage: ImageAssets.arrowIcon,

        childrenItems: [
          {"image": ImageAssets.flagIcon, "text": "EN"},
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 47.h),
              Text("Login".tr, style: AppTextStyles.headline1),
              SizedBox(height: 19.h),
              Text(
                "Enter your details to login",
                style: AppTextStyles.headline2,
              ),
              SizedBox(height: 41.h),
              CustomTextField(
                hintText: "Enter your email here",
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
              SizedBox(height: 24.h),

              CustomElevatedButton(
                text: "Login",
                onPressed: () {
                  print("Create Account Clicked");
                },
              ),
              SizedBox(height: 28.h),
              InkWell(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forget Password?",
                    style: AppTextStyles.loginText,
                  ),
                ),
              ),
              SizedBox(height: 64.h),
              CustomOrDivider(),
              SizedBox(height: 40.h),
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
                    "Don't have an account? ",
                    style: AppTextStyles.altextText,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Login Clicked!");
                      Get.to(
                        () => CreateAccountScreen(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 500),
                      );
                    },
                    child: Text(
                      "Create One",
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
