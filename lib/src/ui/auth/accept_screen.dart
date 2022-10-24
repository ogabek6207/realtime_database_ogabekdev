import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import '../../utils/utils.dart';
import '../widget/button.dart';


class AcceptScreen extends StatefulWidget {

  const AcceptScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AcceptScreenState createState() => _AcceptScreenState();
}

bool _loading = false;

class _AcceptScreenState extends State<AcceptScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isNext = false;

  @override
  void initState() {
    _codeController.addListener(
          () {
        if (_codeController.text.length == 4) {
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
                  length: 5,
                  keyboardType: TextInputType.number,
                  controller: _codeController,
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
            onTap: () async {}

          ),
        ],
      ),
    );
  }
}
