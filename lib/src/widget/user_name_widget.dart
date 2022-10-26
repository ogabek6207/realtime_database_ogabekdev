import 'package:flutter/material.dart';

import '../color/app_color.dart';
import '../utils/utils.dart';

class UserNameWidget extends StatelessWidget {
  final String hintText;

  final TextEditingController controller;

  const UserNameWidget(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

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
        borderRadius: BorderRadius.circular(28 * h),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontFamily: AppColor.fontFamilyNunitoSans,
            fontWeight: FontWeight.w600,
            fontSize: 16 * h,
            color: AppColor.dark,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColor.grey.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
