import 'dart:async';

import 'package:booking_car/src/ui/screens/login_screen.dart';
import 'package:booking_car/src/ui/widgets/logo_widget.dart';
import 'package:booking_car/src/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, LoginScreen.route);
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LogoWidget(fontSize: 30,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
