import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_custom_widgets/colors.dart';

class VehicleTextFrom extends StatefulWidget {
  final String formText;
  final TextEditingController controller;
  const VehicleTextFrom({super.key, required this.formText, required this.controller});

  @override
  State<VehicleTextFrom> createState() => _VehicleTextFromState();
}

class _VehicleTextFromState extends State<VehicleTextFrom> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: widget.formText,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize: 13,
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
