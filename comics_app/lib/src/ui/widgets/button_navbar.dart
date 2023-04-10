import 'package:comics_app/src/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:comics_app/src/constants/color.global.dart';
import 'package:comics_app/src/constants/media.global.dart';

extension HomeExtension on HomeScreenState {
BottomNavigationBarItem buttonNavBar(String icon, String label, bool active) {
  return BottomNavigationBarItem(
      icon: Container(
        width: 48,
        height: 48,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: !active ? GlobalColors.bgColor : null,
              gradient: active ? GlobalColors.buttonBottomBarGradient : null,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: SvgPicture.asset(icon,color: active? Colors.white:GlobalColors.nonActiveColor,)),
      label: label);
}
}

