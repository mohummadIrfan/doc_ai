import 'package:doctor_ai/utlis/appColors.dart';
import 'package:doctor_ai/utlis/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOrDivider extends StatelessWidget {
  final String text;
  final Color dividerColor;
  final double thickness;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final EdgeInsets padding;

  CustomOrDivider({
    Key? key,
    this.text = "OR",
    this.dividerColor = AppColors.btnColor,
    this.thickness = 1.0,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.bold,
    this.textColor = AppColors.grey,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: thickness.h, // Responsive thickness
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w), // Responsive padding
          child: Text(text, style: AppTextStyles.orText),
        ),
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: thickness.h, // Responsive thickness
          ),
        ),
      ],
    );
  }
}
