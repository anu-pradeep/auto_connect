import 'package:flutter/material.dart';

import '../common_custom_widgets/colors.dart';

class PolicyNoTextField extends StatelessWidget {

  final TextEditingController controller;
  final String? Function(String?)? validator;
   PolicyNoTextField(
      {super.key,  required this.controller,required this.validator});
  bool isInsured = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Policy number ',
        hintStyle: TextStyle(
            color: CustomColors.textFormTextColor,
            fontSize: 15,
            fontFamily: 'PoppinsBold'),
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
      validator: validator,
      // validator: (value){
      //   if(isInsured && (value == null|| value.isEmpty))
      //   {
      //     return "Required";
      //   }
      //   return null;
      // },
    );
  }
}
