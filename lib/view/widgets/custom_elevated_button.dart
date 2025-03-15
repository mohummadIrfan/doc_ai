import 'package:doctor_ai/utlis/appColors.dart';
import 'package:doctor_ai/utlis/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final IconData? icon;
  final String? iconImage; // Image icon support
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final bool isLoading; // Loading state

  const CustomElevatedButton({
    Key? key,
    this.text,
    this.onPressed,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.icon,
    this.iconImage, // Image icon support
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.isLoading = false, // Default false
  }) : super(key: key);

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Smooth animation
      height: (widget.height ?? 50).h, // Responsive height
      width:
          widget.isLoading ? 50.w : (widget.width ?? 337).w, // Responsive width
      child: ElevatedButton(
        onPressed:
            widget.isLoading ? null : widget.onPressed, // Disable when loading
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor ?? AppColors.btnColor,
          foregroundColor: widget.textColor ?? AppColors.white,
          padding:
              widget.padding ??
              EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.r,
            ), // Responsive border radius
            side: BorderSide(color: widget.borderColor ?? Colors.transparent),
          ),
        ),
        child:
            widget.isLoading
                ? SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        size: 20.sp, // Responsive icon size
                        color: widget.textColor ?? AppColors.white,
                      ),
                      SizedBox(width: 8.w), // Responsive spacing
                    ] else if (widget.iconImage != null) ...[
                      Image.asset(widget.iconImage!, width: 20.w, height: 20.h),
                      SizedBox(width: 8.w),
                    ],
                    Text(widget.text ?? "Button", style: AppTextStyles.btnText),
                  ],
                ),
      ),
    );
  }
}
