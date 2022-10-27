import 'package:flutter/material.dart';
import '../color/app_color.dart';
import '../utils/utils.dart';

class DoneWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool loading;

  const DoneWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 25*w, right: 25*w),
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(28 * h),
        ),
        height: 56 * h,
        child: Center(
          child: loading
              ? const CircularProgressIndicator()
              : Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamilyNunitoSans,
                    fontWeight: FontWeight.w700,
                    fontSize: 18 * h,
                    color: AppColor.white,
                  ),
                ),
        ),
      ),
    );
  }
}
