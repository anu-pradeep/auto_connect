import 'package:flutter/material.dart';
import '../common_custom_widgets/colors.dart';

class TextformFieldEmail extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  const TextformFieldEmail({super.key, required this.hinttext, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Padding(
        padding: const EdgeInsets.only(left: 40,right: 40),
        child: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.email],
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(
              color: CustomColors.textFormTextColor,
              fontSize: 15,
              fontFamily: 'PoppinsBold',
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            filled: true,
            fillColor: CustomColors.whiteColor, // Background inside TextField
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
        ),
      ),
    );
  }
}
