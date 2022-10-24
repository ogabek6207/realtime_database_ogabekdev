import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 25*w, right: 25*w),
        children: [
           SizedBox(
            height: 68*h,
          ),
          SvgPicture.asset('assets/icons/zetgramm.svg'),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 233,
                child: Row(
                  children: [
                     Text(
                      'Log In',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamilyNunitoSans,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xFF383838)
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
