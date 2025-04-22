// import 'package:auto_connect/screens/add_enquiry_screen/textform_field.dart';
// import 'package:auto_connect/screens/add_enquiry_screen/vehicle_list_dropdown.dart';
// import 'package:auto_connect/screens/common_custom_widgets/icon_button.dart';
// import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../common_custom_widgets/colors.dart';
// import 'check_box.dart';
// import 'command_field.dart';
// import 'customer_dropdown_field.dart';
//
// class EnquiryContainer extends StatefulWidget {
//   const EnquiryContainer({super.key});
//
//   @override
//   State<EnquiryContainer> createState() => _EnquiryContainerState();
// }
//
// class _EnquiryContainerState extends State<EnquiryContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: CustomColors.whiteColor,
//           borderRadius: BorderRadius.circular(10.0),
//           boxShadow: [
//             BoxShadow(
//                 color: CustomColors.borderColor.withOpacity(0.5),
//                 spreadRadius: 3,
//                 blurRadius: 5,
//                 offset: const Offset(0, 3))
//           ]),
//       height: 500,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HeadingText(
//                 heading: 'Add Enquiry',
//                 colorName: CustomColors.blackColor,
//                 fontSize: 17),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 HeadingText(
//                     heading: ' Customer',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 13),
//
//                 CustomIconButton(
//                   addButton: () {},
//                 ),
//                 const SizedBox(width: 550),
//                 HeadingText(
//                     heading: ' Vehicle',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 13),
//
//                 CustomIconButton(
//                   addButton: () {},
//                 ),
//               ],
//             ),
//             const Row(
//               children: [
//                 Expanded(child: CustomerDropdownField(hintText: 'Customer',)),
//                 SizedBox(width: 100),
//                 Expanded(child: VehicleDropdownField(hintText1: 'Vehicle',)),
//               ],
//             ),
//             const SizedBox(height: 30),
//             HeadingText(heading: ' Customer Command', colorName: CustomColors.blackColor, fontSize: 13),
//             const SizedBox(height: 10),
//             const CustomerCommandField(),
//             const SizedBox(height: 10),
//             Row(
//
//               children: [
//                 HeadingText(
//                     heading: ' Odometer',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 13),
//                 const SizedBox(width: 340),
//                 HeadingText(
//                     heading: ' Driver Name',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 13),
//                 const SizedBox(width: 330),
//                 HeadingText(
//                     heading: ' Driver Phone',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 13),
//               ],
//             ),
//             const SizedBox(height: 10),
//             const Row(
//               children: [
//                 SizedBox(width:350,child: threeTextFromField(textHint: 'Odometer Reading',)),
//                 SizedBox(width: 65),
//                 SizedBox(width:350,child: threeTextFromField(textHint: 'Driver Name',)),
//                 SizedBox(width: 65),
//                 SizedBox(width:350,child: threeTextFromField(textHint: 'Driver Phone',)),
//               ],
//             ),
//             const SizedBox(height: 10),
//             HeadingText(heading: ' Is Insured', colorName:  CustomColors.blackColor, fontSize: 13),
//             const EnquiryCheckBox()
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common_custom_widgets/colors.dart';
import 'checkbox_column.dart';

class EnquiryContainer extends StatefulWidget {
  const EnquiryContainer({super.key});

  @override
  State<EnquiryContainer> createState() => _EnquiryContainerState();
}

class _EnquiryContainerState extends State<EnquiryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: CustomColors.borderColor.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3))
          ]),
      height: 630,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(
                  heading: 'Add Enquiry',
                  colorName: CustomColors.blackColor,
                  fontSize: 17),
              const SizedBox(height: 10),
              const CheckboxColumn(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
