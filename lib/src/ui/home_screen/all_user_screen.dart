import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/bloc/auth_bloc.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/widget/appBar_title_widget.dart';
import '../../model/user_model.dart';

class AllUserScreen extends StatefulWidget {
  const AllUserScreen({
    super.key,
  });

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  @override
  void initState() {
    authBloc.allUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.defaultColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.defaultColor,
          title: const AppBarTitleWidget("All User")),
      body: StreamBuilder<List<UserModel>>(
        stream: authBloc.fetchUser,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return buildUser(data[index]);
            },
          );
        },
      ),
    );
  }

  Widget buildUser(UserModel user) => ListTile(
        title: Text(user.phone),
        subtitle: Text(user.password),
      );
}
