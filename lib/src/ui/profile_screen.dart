import 'package:flutter/material.dart';

import '../bloc/auth_bloc.dart';
import '../model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    authBloc.allUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<UserModel>>(
        stream: authBloc.fetchUser,
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          final data = snapshot.data!;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return buildUser(data[index]);
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget buildUser(UserModel user) => ListTile(
        title: Text(user.phone),
        subtitle: Text(user.password),
      );
}
