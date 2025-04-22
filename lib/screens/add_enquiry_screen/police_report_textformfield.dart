import 'package:flutter/material.dart';
import '../common_custom_widgets/colors.dart';

class PoliceReportField extends StatelessWidget {
  final TextEditingController controller;
  final bool isInsured;
  final String? Function(String?)? validator;

  PoliceReportField({
    super.key,
    required this.controller,
    required this.isInsured,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Police Report Number',
          hintStyle: TextStyle(
            color: CustomColors.textFormTextColor,
            fontSize: 15,
            fontFamily: 'PoppinsBold',
          ),
          filled: true,
          fillColor: CustomColors.whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
          ),
        ),
        validator: validator
        //     (value) {
        //   if (isInsured && (value == null || value.isEmpty)) {
        //     return "Required";
        //   }
        //   return null;
        // },
        );
  }
}
