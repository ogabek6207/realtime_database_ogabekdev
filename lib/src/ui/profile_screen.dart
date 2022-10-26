import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/widget/leading_widget.dart';

import '../bloc/auth_bloc.dart';
import '../model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<UserModel>? userModel;

  @override
  void initState() {
    authBloc.getUserProfile('909166207');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.defaultColor,
      appBar: AppBar(
        backgroundColor: AppColor.defaultColor,
        elevation: 1,
      ),
      body: StreamBuilder<List<UserModel>>(
        stream: authBloc.fetchUser,
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.hasData || userModel != null) {
            if (snapshot.hasData) {
              userModel = snapshot.data!;
            }

            return buildUser(userModel!.first);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildUser(UserModel user) => ListTile(
        title: Text(user.phone),
        subtitle: Text(user.password),
      );
}
