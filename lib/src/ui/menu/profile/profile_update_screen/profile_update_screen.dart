import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/dialog/gender_choose_dialog.dart';
import 'package:realtime_database_ogabekdev/src/widget/appBar_title_widget.dart';
import 'package:realtime_database_ogabekdev/src/widget/done_widget.dart';
import 'package:realtime_database_ogabekdev/src/widget/leading_widget.dart';
import '../../../../bloc/auth_bloc.dart';
import '../../../../model/user_model.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/label_widget.dart';
import '../../../../widget/phone_number_widget.dart';
import '../../../../widget/textField_widget.dart';
import '../../../../widget/user_name_widget.dart';

class ProfileUpdateScreen extends StatefulWidget {
  final UserModel data;

  const ProfileUpdateScreen({super.key, required this.data});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerBio = TextEditingController();
  UserModel json = UserModel.fromJson({});

  @override
  void initState() {
    _controllerUserName.text = widget.data.name;
    _controllerPhone.text = widget.data.phone;
    _controllerPassword.text = widget.data.password;
    json = widget.data;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const LeadingWidget(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.white,
        elevation: 1,
        title: const AppBarTitleWidget("Profile Update"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 36 * h,
                    ),
                    Row(
                      children: const [
                        LabelWidget(
                          title: "Phone Number",
                        ),
                      ],
                    ),
                    PhoneNumberWidget(
                      controller: _controllerPhone,
                    ),
                    SizedBox(
                      height: 36 * h,
                    ),
                    Row(
                      children: const [
                        LabelWidget(
                          title: "UserName",
                        ),
                      ],
                    ),
                    UserNameWidget(
                      hintText: 'Username',
                      controller: _controllerUserName,
                    ),
                    SizedBox(
                      height: 36 * h,
                    ),
                    Row(
                      children: const [
                        LabelWidget(
                          title: "Password",
                        ),
                      ],
                    ),
                    TextFieldWidget(
                      hintText: 'Create your password',
                      controller: _controllerPassword,
                    ),
                    SizedBox(
                      height: 36 * h,
                    ),
                    Row(
                      children: const [
                        LabelWidget(
                          title: "Change Bio",
                        ),
                      ],
                    ),
                    UserNameWidget(
                      hintText: 'Create enter your bio',
                      controller: _controllerBio,
                    ),
                    SizedBox(
                      height: 36 * h,
                    ),
                    Row(
                      children: const [
                        LabelWidget(
                          title: "Choose Gender",
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        GenderChooseDialog.genderChoose(context, "Erkak");
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20 * w,
                            right: 20 * w,
                            top: 20 * h,
                            bottom: 20 * h),
                        margin: EdgeInsets.only(
                            top: 16 * h, left: 25 * w, right: 25 * w),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0,
                              blurRadius: 75,
                              offset: Offset(0, 10 * w),
                              color: AppColor.drop.withOpacity(0.1),
                            )
                          ],
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(28 * h),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                "Erkak",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16 * h,
                                  color: AppColor.dark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50 * h,
                    ),
                  ],
                ),
              ],
            ),
          ),
          DoneWidget(
            title: "Update",
            onTap: () {
              if (_controllerUserName.text.isNotEmpty) {
                json.name = _controllerUserName.text;
                json.password = _controllerPassword.text;
                authBloc.updateUser(json);
                Navigator.pop(context);
              }
            },
          ),
          SizedBox(
            height: 25 * h,
          ),
        ],
      ),
    );
  }

  Widget buildUser(UserModel user) => ListTile(
        title: Text(user.phone),
        subtitle: Text(user.password),
      );
}
