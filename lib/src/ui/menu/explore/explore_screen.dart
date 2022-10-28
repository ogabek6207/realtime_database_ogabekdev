import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/widget/appBar_title_widget.dart';
import '../../../utils/utils.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  var items = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
  ];

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColor.white,
        title: const AppBarTitleWidget("Explore"),
        actions: [
          SvgPicture.asset("assets/icons/search.svg"),
          SizedBox(
            width: 25 * w,
          ),
        ],
      ),
      body: ListView(
        children: [
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 25 * w, top: 25 * w),
                decoration: const BoxDecoration(),
                child: Image.asset(
                  items[index],
                  fit: BoxFit.fitWidth,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
