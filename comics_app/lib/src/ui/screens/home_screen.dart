import 'package:comics_app/src/constants/color.global.dart';
import 'package:comics_app/src/constants/media.global.dart';
import 'package:comics_app/src/ui/widgets/book_item.dart';
import 'package:comics_app/src/ui/widgets/home_carousel.dart';
import 'package:comics_app/src/ui/widgets/rank_item.dart';
import 'package:flutter/material.dart';
import '../../constants/variable.global.dart';
import '../widgets/book_list_view.dart';
import '../widgets/button_navbar.dart';
import '../widgets/home_appbar.dart';
import '../widgets/rank_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: GlobalColors.bgColor,
        appBar: HomeAppBar(),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(VariableGlobal.bottomBarRadius),
            topRight: Radius.circular(VariableGlobal.bottomBarRadius),
          ),
          child: Container(
            color: GlobalColors.bottomAppBarBgColor,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: GlobalColors.nonActiveColor,
              backgroundColor: GlobalColors.bottomAppBarBgColor,
              iconSize: 24,
              currentIndex: _selected,
              onTap: (value) {
                setState(() {
                  _selected = value;
                });
              },
              items: <BottomNavigationBarItem>[
                buttonNavBar(MediaGlobal.homeIcon, "Trang chủ", _selected == 0),
                buttonNavBar(
                    MediaGlobal.discoverIcon, "Khám phá", _selected == 1),
                buttonNavBar(MediaGlobal.hotIcon, "Có gì HOT", _selected == 2),
                buttonNavBar(MediaGlobal.bookIcon, "Tủ sách", _selected == 3),
                buttonNavBar(MediaGlobal.personIcon, "Của tôi", _selected == 4),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              HomeCarousel(),
              SizedBox(height: 20),
              BookListView(),
              RankListView(),
              BookListView(),
              BookListView(),
              BookListView(),
            ],
          ),
        ));
  }
}
