import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_database_ogabekdev/src/widget/done_widget.dart';
import '../../color/app_color.dart';
import '../../utils/utils.dart';
import '../../widget/label_widget.dart';
import '../../widget/textField_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _controller = TextEditingController();

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
          "Forgot Password",
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
            "Enter your email for the verification proccess, and we will send 4 digits code to your email for the verification.",
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
          LabelWidget(
            title: "Email",
          ),
          TextFieldWidget(
            hintText: 'Enter your email',
            controller: _controller,
          ),
          SizedBox(
            height: 44 * h,
          ),
          DoneWidget(title: "Continue", onTap: (){},),
        ],
      ),
    );
  }
}
