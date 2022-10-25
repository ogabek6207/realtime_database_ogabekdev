import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/ui/auth/accept_screen.dart';
import 'package:realtime_database_ogabekdev/src/widget/done_widget.dart';
import '../../widget/appBar_title_widget.dart';
import '../../widget/leading_widget.dart';
import '../../widget/phone_number_widget.dart';
import 'home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();
  String _verificationCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.defaultColor,
      appBar: AppBar(
        leading: LeadingWidget(),
        backgroundColor: AppColor.defaultColor,
        elevation: 0,
        title: const AppBarTitleWidget(),
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
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () {
                    _verifyPhone(_controller.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AcceptScreen(
                            phone: _controller.text,
                            verificationCode: _verificationCode),
                      ),
                    );
                  },
                  child: DoneWidget(title: "Submit")),
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
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            }
          });
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
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }
}
