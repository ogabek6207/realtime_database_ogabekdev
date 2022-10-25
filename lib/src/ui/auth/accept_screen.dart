import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:realtime_database_ogabekdev/src/ui/auth/sign_up_screen.dart';

import '../../utils/utils.dart';
import '../widget/button.dart';
import 'home.dart';

class AcceptScreen extends StatefulWidget {
  final String phone;
 final String verificationCode;

  const AcceptScreen({super.key, required this.phone, required this.verificationCode});

  @override
  // ignore: library_private_types_in_public_api
  _AcceptScreenState createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final bool _loading = false;
  bool _isNext = false;

  @override
  void initState() {
    _pinPutController.addListener(
      () {
        if (_pinPutController.text.length == 6) {
          setState(() {
            _isNext = true;
          });
        } else {
          setState(() {
            _isNext = false;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.transparent,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: 138 * h, left: 16 * w, bottom: 16 * h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Tasdiqlash',
                        style: TextStyle(
                          fontSize: 24 * h,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8 * h,
                      ),
                      const Text('Tasdiqalsh kodi telefon raqamiga jonatildi'),
                    ],
                  ),
                ),
                Pinput(
                  length: 6,
                  keyboardType: TextInputType.number,
                  controller: _pinPutController,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          ButtonWidget(
            width: 343 * w,
            margin: EdgeInsets.only(
                left: 16 * h, right: 16 * h, bottom: Platform.isIOS ? 32 : 24),
            height: 54,
            loading: _loading,
            color: _isNext ? Colors.blueAccent : Colors.grey,
            text: 'Tasdiqlash',
            onTap: () async {
              try {
                await FirebaseAuth.instance
                    .signInWithCredential(
                  PhoneAuthProvider.credential(
                      verificationId: widget.verificationCode,
                      smsCode: _pinPutController.text),
                )
                    .then(
                  (value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                          (route) => false);
                    }
                  },
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      e.toString(),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
