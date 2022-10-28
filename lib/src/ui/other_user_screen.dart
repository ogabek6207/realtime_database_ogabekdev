import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../color/app_color.dart';
import '../utils/utils.dart';
import '../widget/appBar_title_widget.dart';
import '../widget/leading_widget.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingWidget(),
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColor.white,
        title: const AppBarTitleWidget("Profile"),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 25 * w,
          right: 25 * w,
        ),
        children: [
          SizedBox(
            height: 35 * h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 86 * h,
                width: 86 * h,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/user2.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 25 * w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Ramsay Michael Snow",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyNunitoSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 20 * h,
                      color: AppColor.dark,
                    ),
                  ),
                  Text(
                    "@michaelrsnow",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyNunitoSans,
                      fontWeight: FontWeight.w600,
                      fontSize: 16 * h,
                      color: AppColor.dark.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(
                    height: 6 * h,
                  ),
                  Text(
                    "@Jakarta, Indonesia",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyNunitoSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 14 * h,
                      color: AppColor.dark.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30 * h,
          ),
          Row(
            children: [
              Container(
                height: 58 * h,
                width: 92 * w,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: AppColor.blue,
                  ),
                  borderRadius: BorderRadius.circular(30 * h),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/icons/message_circle.svg"),
                ),
              ),
              SizedBox(
                width: 25 * w,
              ),
              Expanded(
                child: Container(
                  height: 58 * h,
                  decoration: BoxDecoration(
                    color: AppColor.blue,
                    border: Border.all(
                      width: 2,
                      color: AppColor.blue,
                    ),
                    borderRadius: BorderRadius.circular(30 * h),
                  ),
                  child: Center(
                    child: Text(
                      "Follow",
                      style: TextStyle(
                        fontFamily: AppColor.fontFamilyNunitoSans,
                        fontWeight: FontWeight.w700,
                        fontSize: 18 * h,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 36 * h,
          ),
          SizedBox(
            height: 92 * h,
            child: Row(
              children: [
                SizedBox(
                  width: 30 * w,
                ),
                Column(
                  children: [
                    Text(
                      "890",
                      style: TextStyle(
                        fontFamily: AppColor.fontFamilyNunitoSans,
                        fontWeight: FontWeight.w700,
                        fontSize: 20 * h,
                        color: AppColor.dark,
                      ),
                    ),
                    Text(
                      "Likes",
                      style: TextStyle(
                        fontFamily: AppColor.fontFamilyNunitoSans,
                        fontWeight: FontWeight.w400,
                        fontSize: 14 * h,
                        color: AppColor.dark.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "1293",
                      style: TextStyle(
                        fontFamily: AppColor.fontFamilyNunitoSans,
                        fontWeight: FontWeight.w700,
                        fontSize: 20 * h,
                        color: AppColor.dark,
                      ),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        fontFamily: AppColor.fontFamilyNunitoSans,
                        fontWeight: FontWeight.w400,
                        fontSize: 14 * h,
                        color: AppColor.dark.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "1436",
                      style: TextStyle(
                        fontFamily: AppColor.fontFamilyNunitoSans,
                        fontWeight: FontWeight.w700,
                        fontSize: 20 * h,
                        color: AppColor.dark,
                      ),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                        fontFamily: AppColor.fontFamilyNunitoSans,
                        fontWeight: FontWeight.w400,
                        fontSize: 14 * h,
                        color: AppColor.dark.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30 * w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30 * h,
          ),
          Row(
            children: [
              SizedBox(
                height: 150 * h,
                width: 150 * h,
                child: Image.asset(
                  "assets/images/posts1.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 150 * h,
                width: 150 * h,
                child: Image.asset(
                  "assets/images/posts2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25 * h,
          ),
          Row(
            children: [
              SizedBox(
                height: 150 * h,
                width: 150 * h,
                child: Image.asset(
                  "assets/images/posts3.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 150 * h,
                width: 150 * h,
                child: Image.asset(
                  "assets/images/posts4.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
