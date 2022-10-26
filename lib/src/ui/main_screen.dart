import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realtime_database_ogabekdev/src/ui/home_screen/all_user_screen.dart';

import '../color/app_color.dart';
import '../utils/utils.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 0;

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          AllUserScreen(),
          AllUserScreen(),
          AllUserScreen(),
          AllUserScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          labelColor: AppColor.blue,
          unselectedLabelColor: AppColor.dark,
          unselectedLabelStyle: TextStyle(
            color: AppColor.blue,
            fontSize: 10 * h,
          ),
          controller: _tabController,
          tabs: [
            Tab(
              icon: _selectIndex == 0
                  ? SvgPicture.asset(
                      'assets/menu/home_selected.svg',
                    )
                  : SvgPicture.asset(
                      'assets/menu/home_unselected.svg',
                    ),
              text: "Home",
            ),
            Tab(
                icon: _selectIndex != 2
                    ? SvgPicture.asset(
                        'assets/menu/catalog_selected.svg',
                      )
                    : SvgPicture.asset(
                        'assets/menu/catalog_unselected.svg',
                      ),
                text: "Category"),
            Tab(
                icon: SvgPicture.asset(
                  _selectIndex == 0
                      ? 'assets/menu/card_selected.svg'
                      : 'assets/menu/card_unselected.svg',
                ),
                text: "Cart"),
            Tab(
                icon: _selectIndex == 0
                    ? SvgPicture.asset(
                        'assets/menu/favourite_selected.svg',
                      )
                    : SvgPicture.asset(
                        'assets/menu/favourite_unselected.svg',
                      ),
                text: "Favourite"),
            Tab(
                icon: _selectIndex == 0
                    ? SvgPicture.asset(
                        'assets/menu/menu_selected.svg',
                      )
                    : SvgPicture.asset(
                        'assets/menu/menu_unselected.svg',
                      ),
                text: "Account"),
          ],
        ),
      ),
    );
  }
}
