import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realtime_database_ogabekdev/src/model/user_model.dart';

class UserFireStore {
  final _firestore = FirebaseFirestore.instance.collection('users');

  Future<List<UserModel>> getAllUser() async {
    QuerySnapshot users = await _firestore.get();
    List<UserModel> data = [];
    for (int i = 0; i < users.size; i++) {
      UserModel userModel = UserModel.fromJson(
        users.docs[i].data() as Map<String, dynamic>,
      );
      userModel.id = users.docs[i].id;
      data.add(userModel);
    }
    return data;
  }

  Future<void> saveUser(UserModel data) async {
    await _firestore.add(data.toJson());
  }

  Future<void> deleteUser(String id) async {
    await _firestore.doc(id).delete();
  }

  Future<void> updateUser(UserModel data) async {
    await _firestore.doc(data.id).update(data.toJson());
  }
}
