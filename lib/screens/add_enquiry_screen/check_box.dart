// import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
// import 'package:flutter/material.dart';
//
// class EnquiryCheckBox extends StatefulWidget {
//   const EnquiryCheckBox({super.key});
//
//   @override
//   State<EnquiryCheckBox> createState() => _EnquiryCheckBoxState();
// }
//
// class _EnquiryCheckBoxState extends State<EnquiryCheckBox> {
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Transform.scale(
//       scale: 1.6,
//       child:
//     Checkbox(
//         checkColor: CustomColors.whiteColor,
//         activeColor:  CustomColors.redColor,
//         value: isChecked,
//         onChanged: (bool? value) {
//           setState(() {
//             isChecked = value!;
//           });
//         },
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05),
//         ),
//         side: BorderSide(color: CustomColors.borderColor),
//       ),
//     );
//   }
// }
//// new code
import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class EnquiryCheckBox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  const EnquiryCheckBox({super.key, required this.isChecked, required this.onChanged});

  @override
  State<EnquiryCheckBox> createState() => _EnquiryCheckBoxState();
}

class _EnquiryCheckBoxState extends State<EnquiryCheckBox> {
 late bool isChecked ;
 @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Transform.scale(
            scale: 1.6,
            child:
            Checkbox(
              checkColor: CustomColors.whiteColor,
              activeColor:  CustomColors.redColor,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
                widget.onChanged(value!);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05),
              ),
              side: BorderSide(color: CustomColors.borderColor),
            ),
          ),
        ],
      );
  }
}
