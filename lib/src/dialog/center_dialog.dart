import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color/app_color.dart';
import '../utils/utils.dart';

class CenterDialog {
  static void showDeleteDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (context) {
          double h = Utils.getHeight(context);
          double w = Utils.getWidth(context);
          double o = (h + w) / 2;
          return CupertinoAlertDialog(
            title: const Text("Telefon raqami yoki parol xato"),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 44 * h,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      "ok",
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 20 * o,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
