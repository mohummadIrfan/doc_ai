import 'package:doctor_ai/utlis/appColors.dart';
import 'package:doctor_ai/utlis/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? leadingImage;
  final IconData? leadingIcon;
  final String? title;
  final double sliderMin;
  final double sliderMax;
  final double? sliderValue;
  final Function(double)? onSliderChanged;
  final List<Map<String, String>> childrenItems;
  final Color? backgroundColor;
  final double? height;
  final bool showSlider; // New: Slider is optional

  const CustomAppBar({
    Key? key,
    this.leadingImage,
    this.leadingIcon,
    this.title,
    this.sliderMin = 0,
    this.sliderMax = 50,
    this.sliderValue,
    this.onSliderChanged,
    required this.childrenItems,
    this.backgroundColor,
    this.height = 50, // Increased height for slider visibility
    this.showSlider = false, // Default false
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height?.h ?? 100.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    _sliderValue =
        widget.sliderValue ?? (widget.sliderMin + widget.sliderMax) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: AppBar(
        backgroundColor: widget.backgroundColor ?? Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: _buildLeading(),
        title:
            widget.title != null || widget.showSlider
                ? _buildTitleWithSlider()
                : null,
        centerTitle: true,
        actions:
            widget.childrenItems.map((item) => _buildChildItem(item)).toList(),
      ),
    );
  }

  // **Leading Widget (Image or Icon)**
  Widget _buildLeading() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        width: 31.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child:
              widget.leadingImage != null
                  ? ClipOval(
                    child: Image.asset(
                      widget.leadingImage!,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                  )
                  : widget.leadingIcon != null
                  ? Icon(widget.leadingIcon, color: Colors.black, size: 24.sp)
                  : null,
        ),
      ),
    );
  }

  // **Title with Slider**
  Widget _buildTitleWithSlider() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: 5.h,
            ), // Space between title and slider
            child: Text(
              widget.title!,
              style: AppTextStyles.appBarText.copyWith(fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ),
        if (widget.showSlider) _buildSlider(),
      ],
    );
  }

  // **Slider Widget**
  Widget _buildSlider() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 20),
      child: SizedBox(
        height: 25.h, // Ensure slider has enough height
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.black,
            inactiveTrackColor: Color(0xffE8E8E8),
            trackHeight: 5.h,
            thumbColor: AppColors.black,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 2.r), //
            overlayShape: SliderComponentShape.noOverlay,
            trackShape: const RoundedRectSliderTrackShape(),
          ),
          child: Slider(
            value: _sliderValue,
            min: widget.sliderMin,
            max: widget.sliderMax,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
              if (widget.onSliderChanged != null) {
                widget.onSliderChanged!(value);
              }
            },
          ),
        ),
      ),
    );
  }

  // **Child Items**
  Widget _buildChildItem(Map<String, String> item) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0.r),
      child: Container(
        height: 30.h,
        width: 80.h,
        decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0.r),
              child: Image.asset(item["image"]!, width: 20.w, height: 20.h),
            ),
            SizedBox(width: 5.w),
            Text(item["text"]!, style: AppTextStyles.appBarText),
          ],
        ),
      ),
    );
  }
}
