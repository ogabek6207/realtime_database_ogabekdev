import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../color/app_color.dart';
import '../utils/utils.dart';

class PhoneNumberWidget extends StatefulWidget {
  final TextEditingController controller;

  const PhoneNumberWidget({super.key, required this.controller});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Container(
      padding: EdgeInsets.only(
          left: 20 * w, right: 20 * w, top: 6 * h, bottom: 6 * h),
      margin: EdgeInsets.only(top: 16 * h, left: 25*w, right: 25*w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 75,
            offset: Offset(0, 10 * w),
            color: AppColor.drop.withOpacity(0.1),
          )
        ],
        color: AppColor.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(
        child: TextField(
          maxLength: 9,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: widget.controller,
          style: TextStyle(
            fontFamily: AppColor.fontFamilyNunitoSans,
            fontWeight: FontWeight.w600,
            fontSize: 16 * h,
            color: AppColor.dark,
          ),
          decoration: InputDecoration(
            counterText: "",
            prefix: Padding(
              padding: EdgeInsets.all(4 * h),
              child: Text(
                '+998',
                style: TextStyle(
                  fontFamily: AppColor.fontFamilyNunitoSans,
                  fontWeight: FontWeight.w600,
                  fontSize: 16 * h,
                  color: AppColor.dark,
                ),
              ),
            ),
            border: InputBorder.none,
            hintText: "Enter your phone number",
            hintStyle: TextStyle(
              color: AppColor.grey.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
