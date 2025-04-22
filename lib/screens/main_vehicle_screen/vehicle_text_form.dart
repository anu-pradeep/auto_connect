import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_custom_widgets/colors.dart';

class VehicleTextFrom extends StatefulWidget {
  final String formText;
  const VehicleTextFrom({super.key, required this.formText});

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
          fontFamily: 'PoppinsMedium',
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // to adjust height and width of textformfield
        filled: true,
        fillColor: CustomColors.whiteColor, // Background inside TextField
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
