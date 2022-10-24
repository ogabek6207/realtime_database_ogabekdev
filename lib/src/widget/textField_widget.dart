import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';

import '../utils/utils.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  TextEditingController controller;

  TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Container(
      padding: EdgeInsets.only(
          left: 20 * w, right: 20 * w, top: 10 * h, bottom: 10 * h),
      margin: EdgeInsets.only(top: 16 * h),
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
          controller: widget.controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: AppColor.grey.withOpacity(0.8),
              )),
        ),
      ),
    );
  }
}
