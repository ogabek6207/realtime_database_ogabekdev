import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:realtime_database_ogabekdev/src/ui/auth/home.dart';

import '../../utils/utils.dart';

class AcceptScreen extends StatefulWidget {
  final String phone;

  AcceptScreen(this.phone);

  @override
  // ignore: library_private_types_in_public_api
  _AcceptScreenState createState() => _AcceptScreenState();
}

bool _loading = false;

class _AcceptScreenState extends State<AcceptScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController _codeController = TextEditingController();
  bool _isNext = false;

  @override
  void initState() {
    _verifyPhone();
    _codeController.addListener(
          () {
        if (_codeController.text.length == 6) {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: SvgPicture.asset("assets/icons/arrow_right.svg"),
            ),
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
                    controller: _codeController,
                    onSubmitted: (pin) async {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: _verificationCode!, smsCode: pin))
                            .then((value) async {
                          if (value.user != null) {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) => Home()),
                                    (route) => false);
                          }
                        },);
                      }
                       catch (e){
                        FocusScope.of(context).unfocus();
                        // _scaffoldKey.currentState.showBodyScrim(value, opacity)
                       }
                    }


                )
              ],
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          // ButtonWidget(
          //   width: 343 * w,
          //   margin: EdgeInsets.only(
          //       left: 16 * h, right: 16 * h, bottom: Platform.isIOS ? 32 : 24),
          //   height: 54,
          //   loading: _loading,
          //   color: _isNext ? Colors.blueAccent : Colors.grey,
          //   text: 'Tasdiqlash',
          //   onTap: () async {
          //
          //
          //
          //   },
          // ),
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            print('user logged in');
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(
              () {
            _verificationCode = verificationId;
          },
        );
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
