import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/widget/post_widget.dart';
import '../../utils/utils.dart';
import '../../widget/appBar_title_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColor.white,
        elevation: 0,
        title: const AppBarTitleWidget("Home"),
        actions: [
          Center(
            child: SvgPicture.asset("assets/icons/bell.svg"),
          ),
          SizedBox(
            width: 25 * w,
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const PostWidget(),
      ),
    );
  }
}
