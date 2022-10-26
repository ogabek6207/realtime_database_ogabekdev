import 'package:flutter/foundation.dart';
import 'package:realtime_database_ogabekdev/src/firestore/user_firestore.dart';
import 'package:realtime_database_ogabekdev/src/model/user_model.dart';

class AuthBloc {
  final _userFireStore = UserFireStore();

  allUsers() async {
    List<UserModel> users = await _userFireStore.getAllUser();
    if (kDebugMode) {
      print(users.last.id);
    }
  }

  Future<UserModel?> loginUser(String login, String password) async {
    List<UserModel> users = await _userFireStore.getAllUser();
    for (int i = 0; i < users.length; i++) {
      if (users[i].phone == login && users[i].password == password) {
        return users[i];
      }
    }
    return null;
  }
}

final authBloc = AuthBloc();
