import 'package:flutter/material.dart';

import '../color/app_color.dart';
import '../utils/utils.dart';

class BottomDialog {
  static void showGalleryDialog(
    BuildContext context,
    Function() gallery,
    Function() camera,
  ) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    double o = (h + w) / 2;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 218 * h,
          child: Column(
            children: [
              Container(
                height: 145 * h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 8 * w,
                  right: 8 * w,
                  bottom: 16 * h,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12 * o),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15 * h,
                    ),
                    const Text(
                      "photos",
                      style: TextStyle(
                        color: AppColor.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15 * h,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColor.grey,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        gallery();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15 * h,
                          ),
                          const Text(
                            "From Photos",
                            style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15 * h,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColor.grey,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        camera();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15 * h,
                          ),
                          const Text(
                            "Take Picture",
                            style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 56 * h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10 * o),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 8 * w,
                  ),
                  child: const Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
