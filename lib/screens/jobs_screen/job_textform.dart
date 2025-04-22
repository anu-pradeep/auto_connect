import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_custom_widgets/colors.dart';

class JobTextForm extends StatefulWidget {
  final String jobText;
  const JobTextForm({super.key, required this.jobText});

  @override
  State<JobTextForm> createState() => _JobTextFormState();
}

class _JobTextFormState extends State<JobTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: widget.jobText,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize:13.sp,
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
