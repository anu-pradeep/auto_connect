import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class ContainerRow extends StatelessWidget {
  final String text;

  const ContainerRow({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          color: CustomColors.whiteColor),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: CustomColors.blackColor,
            fontFamily: 'PoppinsRegular',
          ),
        ),
      ),
    );
  }
}
