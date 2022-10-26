import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/widget/done_widget.dart';
import 'package:realtime_database_ogabekdev/src/widget/leading_widget.dart';

import '../bloc/auth_bloc.dart';
import '../model/user_model.dart';
import '../utils/utils.dart';
import '../widget/label_widget.dart';
import '../widget/phone_number_widget.dart';
import '../widget/textField_widget.dart';
import '../widget/user_name_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<UserModel>? userModel;
   TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordAgain =
      TextEditingController();

  @override
  void initState() {
    authBloc.getUserProfile('909166207');

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
                StreamBuilder<List<UserModel>>(
                  stream: authBloc.fetchUser,
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (snapshot.hasData || userModel != null) {
                      if (snapshot.hasData) {
                        userModel = snapshot.data!;
                      }
                      return Column(
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
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
          DoneWidget(
            title: "Update",
            onTap: () {

            },
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
