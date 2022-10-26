import 'package:flutter/foundation.dart';
import 'package:realtime_database_ogabekdev/src/firestore/user_firestore.dart';
import 'package:realtime_database_ogabekdev/src/model/user_model.dart';
import 'package:rxdart/rxdart.dart';

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
}

final authBloc = AuthBloc();
