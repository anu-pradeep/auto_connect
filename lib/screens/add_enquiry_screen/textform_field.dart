import 'package:flutter/material.dart';

import '../common_custom_widgets/colors.dart';

class ThreeTextFromField extends StatefulWidget {
  final String textHint;
  final TextEditingController controller;
  const ThreeTextFromField(
      {super.key, required this.textHint, required this.controller});

  @override
  State<ThreeTextFromField> createState() => _ThreeTextFromFieldState();
}

class _ThreeTextFromFieldState extends State<ThreeTextFromField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: widget.textHint,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize: 15,
          fontFamily: 'PoppinsRegular',
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
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
