import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_database_ogabekdev/src/color/app_color.dart';
import 'package:realtime_database_ogabekdev/src/ui/menu/profile/profile_update_screen/profile_update_screen.dart';
import 'package:realtime_database_ogabekdev/src/widget/appBar_title_widget.dart';
import 'package:realtime_database_ogabekdev/src/widget/leading_widget.dart';

import '../../../bloc/auth_bloc.dart';
import '../../../model/user_model.dart';
import '../../../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<UserModel>? userModel;

  @override
  void initState() {
    authBloc.getUserProfile('909166207');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitleWidget("Profile"),
        actions: [
          StreamBuilder<List<UserModel>>(
            stream: authBloc.fetchUser,
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              if (snapshot.hasData || userModel != null) {
                if (snapshot.hasData) {
                  userModel = snapshot.data!;
                }
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileUpdateScreen(
                            data: userModel!.first,
                          ),
                        ),
                      );
                    },
                    child: SvgPicture.asset("assets/icons/settings.svg"));
              }
              return Container();
            },
          ),
          SizedBox(
            width: 25 * w,
          ),
        ],
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColor.white,
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 25 * w,
          right: 25 * w,
        ),
        children: [
          SizedBox(
            height: 35 * h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 86 * h,
                width: 86 * h,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/image.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 25 * w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Wendy Edwards",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyNunitoSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 20 * h,
                      color: AppColor.dark,
                    ),
                  ),
                  Text(
                    "@wendy10edwards",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyNunitoSans,
                      fontWeight: FontWeight.w600,
                      fontSize: 16 * h,
                      color: AppColor.dark.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(
                    height: 6 * h,
                  ),
                  Text(
                    "@Jakarta, Indonesia",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamilyNunitoSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 14 * h,
                      color: AppColor.dark.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
