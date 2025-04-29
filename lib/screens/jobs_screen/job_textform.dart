import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_custom_widgets/colors.dart';

class JobTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String jobText;
  const JobTextForm({super.key, required this.jobText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: jobText,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize:13.sp,
          fontFamily: 'PoppinsRegular',

        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        filled: true,
        fillColor: CustomColors.whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(08.0),
          borderSide: BorderSide(color: CustomColors.greyColor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(08.0),
          borderSide: BorderSide(color: CustomColors.greyColor, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: BorderSide(color: CustomColors.greyColor, width: 0.5),
        ),
      ),
    );
  }
}
