import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/utils/utils.dart';
import 'package:realtime_database_ogabekdev/src/widget/label_widget.dart';

import '../../widget/textField_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 25 * w, right: 25 * w),
        children: [
          SizedBox(
            height: 68 * h,
          ),
          SvgPicture.asset('assets/icons/zetgramm.svg'),
          SizedBox(
            height: 40 * h,
          ),
          Row(
            children: [
              SizedBox(
                width: 233 * h,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: AppColor.fontFamilyNunitoSans,
                            fontWeight: FontWeight.w700,
                            fontSize: 20 * h,
                            color: AppColor.dark,
                          ),
                        ),
                        SizedBox(
                          height: 4 * h,
                        ),
                        SvgPicture.asset('assets/icons/divider.svg'),
                      ],
                    ),
                    SizedBox(
                      width: 46 * w,
                    ),
                    Column(
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: AppColor.fontFamilyNunitoSans,
                            fontWeight: FontWeight.w700,
                            fontSize: 20 * h,
                            color: AppColor.grey,
                          ),
                        ),
                        SizedBox(
                          height: 4 * h,
                        ),
                        SvgPicture.asset(
                          'assets/icons/divider.svg',
                          color: AppColor.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40 * h,
          ),
          LabelWidget(
            title: "Username or Email",
          ),
          TextFieldWidget(
            hintText: 'Enter your username or email',
            controller: _controllerEmail,
          ),
          SizedBox(
            height: 36 * h,
          ),
          LabelWidget(
            title: "Password",
          ),
          TextFieldWidget(
            hintText: 'Enter your password',
            controller: _controllerPassword,
          ),
          SizedBox(height: 24*h,),
          Row(children: [
            Spacer(),
            Container(
              color: Colors.transparent,
              child: Text("Forgot Password?",

              style: TextStyle(
                fontFamily: AppColor.fontFamilyNunitoSans,
                fontWeight: FontWeight.w400,
                fontSize: 14 * h,
                color: AppColor.dark.withOpacity(0.8),

              ),

              ),),
          ],),

        ],
      ),
    );
  }
}
