
import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import '../utils/utils.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _eye = true;

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Container(
      padding: EdgeInsets.only(
          left: 20 * w, right: 20 * w, top: 6 * h, bottom: 6 * h),
      margin: EdgeInsets.only(top: 16 * h, left: 25*w, right: 25*w,),
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
          obscuringCharacter: '*',
          obscureText: _eye,
          controller: widget.controller,
          style: TextStyle(
            fontFamily: AppColor.fontFamilyNunitoSans,
            fontWeight: FontWeight.w600,
            fontSize: 16 * h,
            color: AppColor.dark,
          ),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                _eye = !_eye;
                setState(() {});
              },
              child: _eye
                  ? const Icon(
                      Icons.visibility_off,
                      color: AppColor.blue,
                    )
                  : const Icon(
                      Icons.visibility,
                      color: AppColor.blue,
                    ),
            ),
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColor.grey.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
