import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_custom_widgets/colors.dart';

class MainEnqTextFrom extends StatelessWidget {
  final String formText;
  final TextEditingController controller;

  const MainEnqTextFrom({super.key, required this.formText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: formText,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize: 13.sp,
          fontFamily: 'PoppinsMedium',
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16.0), // to adjust height and width of textformfield
        filled: true,
        fillColor: CustomColors.whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(08.0),
          borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(08.0),
          borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
        ),
      ),
    );
  }
}
