import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../color/app_color.dart';
import '../ui/widget/button.dart';
import '../utils/utils.dart';

class GenderChooseDialog {
  static void genderChoose(
    BuildContext context,
    String gender,
  ) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        double w = Utils.getWidth(context);
        double h = Utils.getHeight(context);
        return StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            height: 350,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/top.png',
                        fit: BoxFit.cover,
                        color: AppColor.dialog,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 42 * h),
                      child: Center(
                        child: Text(
                          "choose gender",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20 * h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    color: AppColor.dialog,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = "Erkak";
                              print(gender);
                            });
                          },
                          child: Container(
                            height: 48,
                            margin: EdgeInsets.symmetric(horizontal: 16 * w),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: AppColor.grey.withOpacity(0.3)),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10 * w,
                                ),
                                Text(
                                  "male",
                                  style: TextStyle(
                                    color: AppColor.dark,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14 * h,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.all(4 * h),
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: gender != "Erkak"
                                            ? AppColor.grey
                                            : AppColor.blue),
                                  ),
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: gender != "Erkak"
                                          ? Colors.transparent
                                          : AppColor.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = "Ayol";
                              print(gender);
                            });
                          },
                          child: Container(
                            height: 48,
                            margin: EdgeInsets.symmetric(horizontal: 16 * w),
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  color: AppColor.grey.withOpacity(0.3)),
                            )),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "female",
                                  style: TextStyle(
                                    color: AppColor.dark,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14 * h,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.all(4 * h),
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: gender != "Ayol"
                                            ? AppColor.grey
                                            : AppColor.blue),
                                  ),
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: gender != "Ayol"
                                            ? Colors.transparent
                                            : AppColor.blue),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = "Other";
                              print(gender);
                            });
                          },
                          child: Container(
                            height: 48,
                            margin: EdgeInsets.symmetric(horizontal: 16 * w),
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  color: AppColor.grey.withOpacity(0.3)),
                            )),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "other",
                                  style: TextStyle(
                                    color: AppColor.dark,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14 * h,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.all(4 * h),
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: gender != "Other"
                                          ? AppColor.grey
                                          : AppColor.blue,
                                    ),
                                  ),
                                  child: Container(
                                    height: 16 * h,
                                    width: 16 * h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: gender != "Other"
                                            ? Colors.transparent
                                            : AppColor.blue),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        ButtonWidget(
                          margin: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: Platform.isIOS ? 32 : 24),
                          text: "chek",
                          height: 57,
                          width: MediaQuery.of(context).size.width,
                          color: AppColor.blue,
                          onTap: () async {
                            Navigator.pop(context, gender);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
//
