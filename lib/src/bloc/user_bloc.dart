import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

import '../model/user_model.dart';

class UserBloc {
  final userFetch = PublishSubject<CollectionReference<UserModel>>();

  Stream<CollectionReference<UserModel>> get fetchUser => userFetch.stream;

  getNotes() async {
    var getUsers =
        FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
              fromFirestore: (snapshots, _) =>
                  UserModel.fromJson(snapshots.data()!),
              toFirestore: (movie, _) => movie.toJson(),
            );

    userFetch.sink.add(getUsers);
  }

  dispose() {
    userFetch.close();
  }
}

final userBloc = UserBloc();
