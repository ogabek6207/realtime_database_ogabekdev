import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import '../../color/app_color.dart';
import '../../utils/utils.dart';
import '../../widget/done_widget.dart';
import '../../widget/textField_widget.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  TextEditingController _pinPutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      backgroundColor: AppColor.defaultColor,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColor.defaultColor,
        leading: Container(
          color: Colors.transparent,
          child: Center(
            child: SvgPicture.asset("assets/icons/arrow_left.svg"),
          ),
        ),
        title: Text(
          "Code Verification",
          style: TextStyle(
            fontFamily: AppColor.fontFamilyNunitoSans,
            fontWeight: FontWeight.w700,
            fontSize: 18 * h,
            color: AppColor.dark,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 25 * w,
          right: 25 * w,
        ),
        children: [
          SizedBox(
            height: 50 * h,
          ),
          SvgPicture.asset('assets/icons/zetgramm.svg'),
          SizedBox(
            height: 50 * h,
          ),
          Text(
            "Enter the 4 digits code that you received on your email so you can continue to reset your account password.",
            style: TextStyle(
              fontFamily: AppColor.fontFamilyNunitoSans,
              fontWeight: FontWeight.w400,
              height: 26 / 16 * h,
              fontSize: 16 * h,
              color: AppColor.darkGrey,
            ),
          ),
          SizedBox(
            height: 52 * h,
          ),
          Pinput(
            length: 6,
            keyboardType: TextInputType.number,
            controller: _pinPutController,
          ),
          SizedBox(
            height: 44 * h,
          ),
          DoneWidget(title: "Continue"),
        ],
      ),
    );
  }
}
