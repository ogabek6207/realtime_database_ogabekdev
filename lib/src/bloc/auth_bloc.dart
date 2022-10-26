import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/firestore/user_firestore.dart';
import 'package:realtime_database_ogabekdev/src/model/user_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/home_screen/all_user_screen.dart';

class AuthBloc {
  final _userFireStore = UserFireStore();
  final userFetch = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get fetchUser => userFetch.stream;

  allUsers() async {
    List<UserModel> users = await _userFireStore.getAllUser();

    if (kDebugMode) {
      print(users.first.id);
    }
  }

  Future<UserModel?> loginUser(String login, String password) async {
    List<UserModel> users = await _userFireStore.getAllUser();
    if (kDebugMode) {
      print(users);
    }
    for (int i = 0; i < users.length; i++) {
      if (users[i].phone == login && users[i].password == password) {
        return users[i];
      }
    }

    userFetch.sink.add(users);
    return null;
  }

  Future<UserModel?> registerUser(String register) async {
    List<UserModel> users = await _userFireStore.getAllUser();
    if (kDebugMode) {
      print(users);
    }
    for (int i = 0; i < users.length; i++) {
      if (users[i].phone == register) {
        return users[i];
      }
    }

    userFetch.sink.add(users);
    return null;
  }

  saveUser( BuildContext context,
    final String phone,
    final String name,
    final String password,
  ) async {
    await _userFireStore.saveUser(
      UserModel(phone: phone, name: name, password: password),
    );
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("number", phone);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AllUserScreen(),
      ),
    );
  }
}

final authBloc = AuthBloc();
