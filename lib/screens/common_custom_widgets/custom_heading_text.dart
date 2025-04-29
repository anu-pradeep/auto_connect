import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String heading;
  final Color colorName;
  final double fontSize;
  const HeadingText(
      {super.key,
      required this.heading,
      required this.colorName,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: TextStyle(
        color: colorName,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,

        fontFamily: 'PoppinsMedium',
      ),
    );
  }
}
