import 'package:flutter/material.dart';
import '../../common_custom_widgets/colors.dart';

class EnginNOTextField extends StatelessWidget {

  final TextEditingController controller;


  EnginNOTextField({
    super.key,

    required this.controller,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Engine Number',
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


    );
  }
}
