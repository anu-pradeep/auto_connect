import 'package:flutter/material.dart';

import '../common_custom_widgets/colors.dart';

class TextFormFieldPassword extends StatelessWidget {
  final String pwd;
  final bool iconVisible;
  final TextEditingController controller;
  const TextFormFieldPassword(
      {super.key, required this.pwd, required this.iconVisible, required this.controller});

  @override
  Widget build(BuildContext context) {
    bool showPass = true;
    return Padding(
      padding: const EdgeInsets.only(left: 40,right: 40),
      child: TextFormField(
        controller: controller,
          textInputAction: TextInputAction.next,
          obscureText: showPass,
          obscuringCharacter: '.',
          decoration: InputDecoration(
            hintText: pwd,
            hintStyle: TextStyle(
              color: CustomColors.textFormTextColor,
              fontSize: 15,
              fontFamily: 'PoppinsBold',
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            filled: true,
            fillColor: CustomColors.whiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08.0),
              borderSide:
                  BorderSide(color: CustomColors.borderColor, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08.0),
              borderSide:
                  BorderSide(color: CustomColors.borderColor, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.0),
              borderSide:
                  BorderSide(color: CustomColors.borderColor, width: 0.5),
            ),
            // suffixIcon: Visibility(
            //   visible: widget.iconVisible == true,
            //   child: IconButton(
            //     onPressed: () {
            //       setState(() {
            //         if (showPass) {
            //           showPass = false;
            //         } else {
            //           showPass = true;
            //         }
            //       });
            //     },
            //     icon: Icon(showPass == true
            //         ? Icons.visibility_off
            //         : Icons.visibility),
            //     color: CustomColors.borderColor,
            //   ),
            // ),
          )),
    );
  }
}
