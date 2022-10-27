import 'package:realtime_database_ogabekdev/src/firestore/user_firestore.dart';
import 'package:realtime_database_ogabekdev/src/model/user_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc {
  final UserFireStore _userFireStore = UserFireStore();
  final userFetch = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get fetchUser => userFetch.stream;

  allUsers() async {
    List<UserModel> users = await _userFireStore.getAllUser();

    userFetch.sink.add(users);
  }

  getUserProfile(String phone) async {
    List<UserModel> user = await _userFireStore.getUserProfile(phone);

    userFetch.sink.add(user);
  }

  Future<UserModel?> isNumber(String number, String password) async {
    List<UserModel> users = await _userFireStore.getNumberUser(number);
    for (int i = 0; i < users.length; i++) {
      if (users[i].phone == number) {
        if (password == "") {
          return users[i];
        } else if (users[i].password == password) {
          return users[i];
        }
      }
    }
    return null;
  }

  saveUser(
    final String phone,
    final String name,
    final String password,
    final String passwordAgain,
  ) async {
    await _userFireStore.saveUser(
      UserModel(
        phone: phone,
        name: name,
        password: password,
        // createAt: DateTime.now(),
        // updateAt: DateTime.now(),
      ),
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("number", phone);
  }

  updateUser(UserModel data) async {
    await _userFireStore.updateUser(data);
  }
}

final authBloc = AuthBloc();
