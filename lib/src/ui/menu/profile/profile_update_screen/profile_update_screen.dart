import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/widget/done_widget.dart';
import '../../../../bloc/auth_bloc.dart';
import '../../../../model/user_model.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/label_widget.dart';
import '../../../../widget/phone_number_widget.dart';
import '../../../../widget/textField_widget.dart';
import '../../../../widget/user_name_widget.dart';

class ProfileUpdateScreen extends StatefulWidget {
  UserModel data;

  ProfileUpdateScreen({required this.data});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordAgain =
      TextEditingController();

  @override
  void initState() {
    _controllerUserName.text = widget.data.name;
    _controllerPhone.text = widget.data.phone;
_controllerPassword.text = widget.data.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      backgroundColor: AppColor.defaultColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.defaultColor,
        elevation: 1,
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
                          title: "Password Again",
                        ),
                      ],
                    ),
                    TextFieldWidget(
                      hintText: 'Create enter your password',
                      controller: _controllerPasswordAgain,
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
            onTap: () {},
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
