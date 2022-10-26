import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:realtime_database_ogabekdev/src/bloc/auth_bloc.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/dialog/center_dialog.dart';
import 'package:realtime_database_ogabekdev/src/model/user_model.dart';
import 'package:realtime_database_ogabekdev/src/ui/auth/phone_number_screen.dart';
import 'package:realtime_database_ogabekdev/src/ui/auth/sign_up_screen.dart';
import 'package:realtime_database_ogabekdev/src/ui/home_screen/all_user_screen.dart';
import 'package:realtime_database_ogabekdev/src/ui/main_screen.dart';
import 'package:realtime_database_ogabekdev/src/utils/utils.dart';
import 'package:realtime_database_ogabekdev/src/widget/done_widget.dart';
import 'package:realtime_database_ogabekdev/src/widget/label_widget.dart';
import 'package:realtime_database_ogabekdev/src/widget/phone_number_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widget/textField_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerPhone = TextEditingController();
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const SignUpScreen(),
                          ),
                        );
                      },
                      child: Column(
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
                      ),
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
            title: "Phone Number",
          ),
          PhoneNumberWidget(
            controller: _controllerPhone,
          ),
          SizedBox(
            height: 36 * h,
          ),
          const LabelWidget(
            title: "Password",
          ),
          TextFieldWidget(
            hintText: 'Enter your password',
            controller: _controllerPassword,
          ),
          SizedBox(
            height: 24 * h,
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhoneNumberScreen(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.transparent,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyNunitoSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 14 * h,
                      color: AppColor.dark.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30 * h,
          ),
          DoneWidget(
            title: 'Login',
            onTap: () async {
              _getLogin();
            },
          ),
          SizedBox(
            height: 20 * h,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8 * w),
                height: 1 * h,
                width: 94 * w,
                color: AppColor.grey,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20 * w,
                    right: 20 * w,
                  ),
                  child: Text(
                    "Or login with",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyNunitoSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 14 * h,
                      color: AppColor.dark.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8 * w),
                height: 1 * h,
                width: 94 * w,
                color: AppColor.grey,
              ),
            ],
          ),
          SizedBox(
            height: 20 * h,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  blurRadius: 75,
                  spreadRadius: 0,
                  offset: const Offset(0, 6),
                  color: AppColor.shadow.withOpacity(0.15),
                )
              ],
            ),
            height: 56 * h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/google.svg"),
                SizedBox(
                  width: 16 * w,
                ),
                Center(
                  child: Text(
                    "Google",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyNunitoSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 18 * h,
                      color: AppColor.dark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getLogin() async {
    UserModel? data = await authBloc.isNumber(
      "+998${_controllerPhone.text}",
      _controllerPassword.text,
    );
    if (data == null) {
      // ignore: use_build_context_synchronously
      CenterDialog.showDeleteDialog(
        "Telefon raqami yoki parol xato",
        context,
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("number", "+998${_controllerPhone.text}");
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }
  }
}
