import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../color/app_color.dart';
import '../../../dialog/bottom_dialog.dart';
import '../../../utils/utils.dart';
import '../../widget/button.dart';

class EditProfile {
  static void showEditProfile(
    BuildContext context,
  ) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    final ImagePicker _picker = ImagePicker();
    File? dataImage;
    bool loading = false;

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 450,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/top.png',
                          fit: BoxFit.cover,
                          color: AppColor.dialog,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 42 * h),
                        child: Center(
                          child: Text(
                            "change",
                            style: TextStyle(
                              fontSize: 18 * h,
                              color: AppColor.dark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: AppColor.dialog,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24 * h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              BottomDialog.showGalleryDialog(
                                context,
                                () async {
                                  final XFile? image = await _picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  setState(() async {});
                                  dataImage = File(image!.path);
                                  _sendImage(dataImage!);
                                },
                                () async {
                                  final XFile? image = await _picker.pickImage(
                                    source: ImageSource.camera,
                                  );
                                  setState(() {
                                    dataImage = File(image!.path);
                                    _sendImage(dataImage!);
                                  });
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColor.grey)),
                              margin: EdgeInsets.symmetric(horizontal: 16 * w),
                              width: MediaQuery.of(context).size.width,
                              height: 48,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/image.svg',
                                    width: 24,
                                  ),
                                  SizedBox(
                                    width: 10 * w,
                                  ),
                                  Text(
                                    'Surat qo\'shish',
                                    style: TextStyle(
                                        color: AppColor.dark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18 * h),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16 * h,
                          ),
                          SizedBox(
                            height: 16 * h,
                          ),
                          const Spacer(),
                          ButtonWidget(
                            margin: EdgeInsets.only(
                              left: 16 * w,
                              right: 16 * w,
                              bottom: Platform.isIOS ? 32 : 24,
                            ),
                            text: "done",
                            height: 57 * h,
                            width: MediaQuery.of(context).size.width,
                            color: AppColor.blue,
                            loading: loading,
                            onTap: () async {
                              setState(() {
                                loading = true;
                              });
                              setState(() {
                                loading = false;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    Future picImage() async {
      await ImagePicker().pickImage(source: ImageSource.gallery);
    }
  }






  static Future<void> _sendImage(File file) async {
    // await Repository().sendPhoto(file.path);
  }
}
