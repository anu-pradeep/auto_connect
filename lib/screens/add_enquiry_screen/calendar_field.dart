import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';


class CalendarTextField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  const CalendarTextField(
      {super.key, required this.controller, required this.onTap});

  @override
  State<CalendarTextField> createState() => _CalendarTextFieldState();
}

class _CalendarTextFieldState extends State<CalendarTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.whiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08.0),
              borderSide: BorderSide(
                  color: CustomColors.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08.0),
              borderSide: BorderSide(
                  color: CustomColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08.0),
              borderSide: BorderSide(
                  color: CustomColors.borderColor),
            )),
        onTap: widget.onTap,
      ),
    );
  }
}
