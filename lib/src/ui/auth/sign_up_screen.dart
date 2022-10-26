import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/model/user_model.dart';
import 'package:realtime_database_ogabekdev/src/ui/auth/login_screen.dart';
import 'package:realtime_database_ogabekdev/src/ui/home_screen/all_user_screen.dart';
import 'package:realtime_database_ogabekdev/src/utils/utils.dart';
import 'package:realtime_database_ogabekdev/src/widget/done_widget.dart';
import 'package:realtime_database_ogabekdev/src/widget/label_widget.dart';
import 'package:realtime_database_ogabekdev/src/widget/phone_number_widget.dart';

import '../../widget/textField_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool isNext = true;

  @override
  void initState() {
    super.initState();
  }

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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: LoginScreen()));
                      },
                      child: Column(
                        children: [
                          Text(
                            'Log In',
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
                            color: AppColor.dark,
                          ),
                        ),
                        SizedBox(
                          height: 4 * h,
                        ),
                        SvgPicture.asset(
                          'assets/icons/divider.svg',
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
            title: "PhoneNumber",
          ),
          PhoneNumberWidget(controller: _controllerPhoneNumber),
          SizedBox(
            height: 36 * h,
          ),
          LabelWidget(
            title: "UserName",
          ),
          TextFieldWidget(
            hintText: 'Create your username',
            controller: _controllerUserName,
          ),
          SizedBox(
            height: 36 * h,
          ),
          LabelWidget(
            title: "Password",
          ),
          TextFieldWidget(
            hintText: 'Create your password',
            controller: _controllerPassword,
          ),
          SizedBox(
            height: 50 * h,
          ),
          Container(
            height: 1,
            width: 1,
            child: StreamBuilder<QuerySnapshot<UserModel>>(
              stream: getUsers.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<QueryDocumentSnapshot<UserModel>> data1 = [];
                List<QueryDocumentSnapshot<UserModel>> data2 = [];
                final data = snapshot.data!;

                data2 = data.docs;
                for (int i = 0; i < data2.length; i++) {
                  if (data2[i].data().phone ==
                      "+998${_controllerPhoneNumber.text}") {
                    isNext = false;
                    print("Bu bazada raqam bor");
                    break;
                  }
                }

                return ListView.builder(
                  itemCount: data2.length,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                );
              },
            ),
          ),
          DoneWidget(
            title: 'Sign Up',
            onTap: () {
              final user = UserModel(
                phone: "+998${_controllerPhoneNumber.text}",
                name: _controllerUserName.text,
                password: _controllerPassword.text,
              );
            },
          ),
        ],
      ),
    );
  }

  Future createUser(UserModel user) async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user.phone);
    user.id = docUser.id;
    await docUser.set(user.toJson());
    print("Done");
  }

  ///
  final getUsers = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshots, _) => UserModel.fromJson(snapshots.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );
}
