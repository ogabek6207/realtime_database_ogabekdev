import 'package:flutter/material.dart';

import '../color/app_color.dart';
import '../utils/utils.dart';

class DoneWidget extends StatefulWidget {
  String title;

  DoneWidget({
    required this.title,
  });

  @override
  State<DoneWidget> createState() => _DoneWidgetState();
}

class _DoneWidgetState extends State<DoneWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(28),
      ),
      height: 56 * h,
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            fontFamily: AppColor.fontFamilyNunitoSans,
            fontWeight: FontWeight.w700,
            fontSize: 18 * h,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
