import 'package:flutter/material.dart';
import '../../common_custom_widgets/colors.dart';

class ChassisNoTextField extends StatelessWidget {

  final TextEditingController controller;


  const ChassisNoTextField({
    super.key,

    required this.controller,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Chassis Number',
          hintStyle: TextStyle(
            color: CustomColors.textFormTextColor,
            fontSize: 15,
            fontFamily: 'PoppinsRegular',
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
