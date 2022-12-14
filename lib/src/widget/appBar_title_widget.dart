import 'package:flutter/material.dart';
import '../color/app_color.dart';
import '../utils/utils.dart';

class AppBarTitleWidget extends StatefulWidget {
  final String title;

  const AppBarTitleWidget(this.title, {super.key});

  @override
  State<AppBarTitleWidget> createState() => _AppBarTitleWidgetState();
}

class _AppBarTitleWidgetState extends State<AppBarTitleWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    return Text(
      widget.title,
      style: TextStyle(
        fontFamily: AppColor.fontFamilyNunitoSans,
        fontWeight: FontWeight.w700,
        fontSize: 28 * h,
        color: AppColor.dark,
      ),
    );
  }
}
