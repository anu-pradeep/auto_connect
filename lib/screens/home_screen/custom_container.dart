import 'package:flutter/material.dart';

import '../common_custom_widgets/colors.dart';

class CustomContainer extends StatelessWidget {
  final String containerText;
  const CustomContainer({
    super.key,
    required this.containerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: CustomColors.shadowBlackColor,
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
        child: Text(
          containerText,
          style: TextStyle(
            color: CustomColors.skyBlueColor,
            fontSize: 20,

            fontFamily: 'PoppinsMedium',
          ),
        ),
      ),
    );
  }
}
