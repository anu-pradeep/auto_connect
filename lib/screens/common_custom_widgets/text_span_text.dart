import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String mainText;
  final String highlightedText;


  const CustomRichText({
    super.key,
    required this.mainText,
    required this.highlightedText,

  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: mainText,
        style: TextStyle(
          color: CustomColors.blackColor,
          fontSize: 12,
          fontFamily: 'PoppinsMedium',
        ),
        children: [
          TextSpan(
            text: highlightedText,
            style: TextStyle(
              color:  CustomColors.redColor,
              fontSize: 12,
              fontFamily: 'PoppinsMedium',

            ),
          ),
        ],
      ),
    );
  }
}
