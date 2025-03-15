import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final IconData? icon;
  final String? iconImage; // Image icon support

  const CustomBorderButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width = 337,
    this.backgroundColor = Colors.blue, // Default filled color
    this.borderColor = const Color(0xFF000000), // Black border
    this.textColor = Colors.white,
    this.borderRadius = 10,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.icon,
    this.iconImage, // Image file
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Filled color
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius.r,
            ), // Responsive radius
            side: BorderSide(
              color: borderColor,
              width: 1.w,
            ), // Responsive border
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20.sp, color: textColor), // Responsive icon size
              SizedBox(width: 8.w),
            ] else if (iconImage != null) ...[
              Image.asset(
                iconImage!,
                width: 20.w,
                height: 20.h,
              ), // Responsive image size
              SizedBox(width: 8.w),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize.sp, // Responsive font size
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
