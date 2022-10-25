import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/utils.dart';

class LeadingWidget extends StatefulWidget {
  const LeadingWidget({Key? key}) : super(key: key);

  @override
  State<LeadingWidget> createState() => _LeadingWidgetState();
}

class _LeadingWidgetState extends State<LeadingWidget> {

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Container(
      color: Colors.transparent,
      child: Center(
        child: SvgPicture.asset("assets/icons/arrow_left.svg"),
      ),
    );
  }
}
