import 'package:flutter/material.dart';

class CommonElevatedButton extends StatefulWidget {
  final String elevatedText;
  final Color buttonColor;
  final Color textColor;
  final double fontSize;
  final VoidCallback onSave;
  const CommonElevatedButton(
      {super.key,
      required this.elevatedText,
      required this.buttonColor,
      required this.textColor,
      required this.onSave,
      required this.fontSize});

  @override
  State<CommonElevatedButton> createState() => _CommonElevatedButtonState();
}

class _CommonElevatedButtonState extends State<CommonElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onSave,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(08),
            ),
            backgroundColor: widget.buttonColor,
            fixedSize: const Size(130, 70)),
        child: Text(
          widget.elevatedText,
          style: TextStyle(
              color: widget.textColor,
              fontFamily: 'PoppinsMedium',
              fontSize: widget.fontSize),
        ));
  }
}
