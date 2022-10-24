import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;
  final bool loading;
  final EdgeInsets margin;
  final Function() onTap;

  const ButtonWidget({
    Key? key,
    this.loading = false,
    required this.text,
    required this.height,
    required this.width,
    this.margin = const EdgeInsets.all(0),
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          // boxShadow: const [
          //   BoxShadow(
          //       color: Color.fromRGBO(64, 191, 255, 0.24),
          //       blurRadius: 10,
          //       spreadRadius: 5,
          //       offset: Offset(0.1, 0.3))
          // ],
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14 * h,
                  ),
                ),
        ),
      ),
    );
  }
}
