import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/widget/appBar_title_widget.dart';
import '../../model/user_model.dart';

class AllUserScreen extends StatefulWidget {
  String password;

  AllUserScreen({required this.password});

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.defaultColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.defaultColor,
          title: AppBarTitleWidget("All User")),
      body: StreamBuilder<QuerySnapshot<UserModel>>(
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
for(int i = 0; i<data2.length; i++){

  // if(data2[i].data().phone == ){}

}

          return ListView.builder(
            itemCount: data2.length,
            itemBuilder: (context, index) {
              return buildUser(data2[index].data());
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

  final getUsers = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshots, _) => UserModel.fromJson(snapshots.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );
}
