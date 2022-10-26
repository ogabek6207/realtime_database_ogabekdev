import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';

import '../utils/utils.dart';

class LabelWidget extends StatefulWidget {
 final String title;

  const   LabelWidget({super.key, required this.title});

  @override
  State<LabelWidget> createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Container(
      margin: EdgeInsets.only(left: 25*w, right: 25*w),
      child: Text(widget.title,
      style: TextStyle(
        fontFamily: AppColor.fontFamilyNunitoSans,
        fontWeight: FontWeight.w600,
        fontSize: 16 * h,
        color: AppColor.dark3E,
      ),

      ),
    );
  }
}
