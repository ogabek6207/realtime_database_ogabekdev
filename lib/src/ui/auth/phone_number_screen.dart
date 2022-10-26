import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/ui/auth/accept_screen.dart';
import 'package:realtime_database_ogabekdev/src/widget/done_widget.dart';
import '../../model/user_model.dart';
import '../../widget/appBar_title_widget.dart';
import '../../widget/leading_widget.dart';
import '../../widget/phone_number_widget.dart';
import 'home.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();
  String _verificationCode = "";
  bool isNumber = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.defaultColor,
      appBar: AppBar(
        leading: LeadingWidget(),
        backgroundColor: AppColor.defaultColor,
        elevation: 0,
        title: AppBarTitleWidget("Accept"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              PhoneNumberWidget(
                controller: _controller,
              ),
              StreamBuilder<QuerySnapshot<UserModel>>(
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
                  data1 = data.docs;

                  for (int i = 0; i < data1.length; i++) {
                    if ("+998${_controller.text}" ==
                        data.docs[i].data().phone) {
                      isNumber = true;
                      break;
                    } else {
                      isNumber = false;
                    }
                  }

                  return Container();
                },
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  isNumber
                      ? print("Bu telefon raqam mavjud")
                      : _verifyPhone(_controller.text);
                  isNumber
                      ? print("Bu telefon raqam mavjud")
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcceptScreen(
                                phone: _controller.text,
                                verificationCode: _verificationCode),
                          ),
                        );
                },
                child: DoneWidget(
                  title: "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone(String phone) async {
    if (kDebugMode) {
      print(phone);
    }
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+998$phone',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) {
          print(e.message);
        }
      },
      codeSent: (String? verficationID, int? resendToken) {
        setState(() {
          _verificationCode = verficationID!;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(
          () {
            _verificationCode = verificationID;
          },
        );
      },
      timeout: const Duration(seconds: 120),
    );

  }

  final getUsers = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshots, _) => UserModel.fromJson(snapshots.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );
}
