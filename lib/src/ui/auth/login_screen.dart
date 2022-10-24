import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 68,
          ),
          SvgPicture.asset('assets/icons/zetgramm.svg'),
          SizedBox(
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
