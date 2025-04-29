import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class SignInElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onClicked;
  const SignInElevatedButton({super.key, required this.text, required this.onClicked});

  @override
  State<SignInElevatedButton> createState() => _SignInElevatedButtonState();
}

class _SignInElevatedButtonState extends State<SignInElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: widget.onClicked,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: CustomColors.redColor,
            // minimumSize: const Size(double.infinity, 50),
           fixedSize: const Size(230, 50)
          ),
          child: Text(
            widget.text,
            style: TextStyle(
                color: CustomColors.whiteColor,
                fontFamily: 'PoppinsMedium',
                fontSize: 20),
          )),
    );
  }
}
