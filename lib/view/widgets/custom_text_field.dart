import 'package:doctor_ai/utlis/appColors.dart';
import 'package:doctor_ai/utlis/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? prefixImage;
  final String? suffixImage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final double? width;
  final Color? fillColor;
  final Function(String)? onChanged;
  final Function()? onTapSuffixIcon;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixImage,
    this.suffixImage,
    this.obscureText = false,
    this.keyboardType,
    this.width,
    this.fillColor,
    this.onChanged,
    this.onTapSuffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h, // Responsive height
      width: (width ?? 337).w, // Responsive width
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText ?? "Enter text...",
          hintStyle: AppTextStyles.textfieldText,
          filled: true,
          fillColor: fillColor ?? AppColors.textFieldColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: 13.h, // Responsive padding (top-bottom)
            horizontal: 30.w, // Responsive padding (left-right)
          ),

          // Prefix (Icon or Image)
          prefixIcon:
              prefixIcon != null
                  ? Icon(prefixIcon, color: Colors.grey, size: 20.sp)
                  : prefixImage != null
                  ? Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Image.asset(prefixImage!, width: 20.w, height: 20.h),
                  )
                  : null,

          // Suffix (Icon or Image)
          suffixIcon:
              suffixIcon != null
                  ? GestureDetector(
                    onTap: onTapSuffixIcon,
                    child: Icon(suffixIcon, color: Colors.grey, size: 20.sp),
                  )
                  : suffixImage != null
                  ? GestureDetector(
                    onTap: onTapSuffixIcon,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: SizedBox(
                        child: Image.asset(
                          suffixImage!,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  )
                  : null,

          // Rounded Border (Only for shape, no color)
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              20.r,
            ), // Responsive border radius
            borderSide: BorderSide.none, // No border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
