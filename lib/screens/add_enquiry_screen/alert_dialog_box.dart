// import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
// import 'package:flutter/material.dart';
//
// import '../main_inspection_screen/main_inspection_screen.dart';
//
// class EnquiryAlertBox extends StatelessWidget {
//   const EnquiryAlertBox({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//       contentPadding: const EdgeInsets.all(20),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             Icons.error_outline,
//             size: 70,
//             color: CustomColors.yellowColor,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Are you sure you want to go to inspection step..?',
//             style: TextStyle(
//                 fontFamily: 'PoppinsMedium',
//                 fontSize: 15,
//                 color: CustomColors.blackColor),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: CustomColors.redColor,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                 ),
//                 onPressed: () {
//                   // Navigator.pop(context);
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainInspectionScreen()));
//                 },
//                 child: Text("Yes, go!",
//                     style: TextStyle(
//                         color: CustomColors.whiteColor,
//                         fontSize: 15,
//                         fontFamily: 'PoppinsMedium')),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   // Handle "Save as Draft" action here
//                 },
//                 child: Text("No, Save as Draft",
//                     style: TextStyle(
//                         color: CustomColors.blackColor,
//                         fontFamily: 'PoppinsMedium',
//                         fontSize: 15)),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
