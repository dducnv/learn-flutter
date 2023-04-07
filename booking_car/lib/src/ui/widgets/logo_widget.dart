import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double fontSize;
  final Color color;
  const LogoWidget({
    Key? key,
    required this.fontSize, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("BOOKING",
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: color)),
        Text("_🚗_",
            style: TextStyle(
                fontSize: fontSize + 5,
                fontWeight: FontWeight.bold,
                color: color)),
      ],
    );
  }
}
