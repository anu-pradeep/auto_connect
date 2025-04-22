// import 'package:auto_connect/screens/add_enquiry_screen/police_report_textformfield.dart';
// import 'package:auto_connect/screens/add_enquiry_screen/policy_no_textformfield.dart';
// import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
// import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import '../../api_service_classes/insurance_company_api.dart';
// import '../../trial.dart';
// import 'check_box.dart';
// import 'insurance_dropdown.dart';
//
// class CheckboxRow extends StatefulWidget {
//   const CheckboxRow({super.key});
//
//   @override
//   State<CheckboxRow> createState() => _CheckboxRowState();
// }
//
// class _CheckboxRowState extends State<CheckboxRow> {
//   List<Map<String, dynamic>> insuranceCompany = [];
//   String? selectedInsuranceCompany;
//   final formKey = GlobalKey<FormState>();
//   bool isInsured = false;
//   final TextEditingController policyNoController = TextEditingController();
//   final TextEditingController policeReportNoController =
//       TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // HeadingText(
//             //     heading: 'Is Insured',
//             //     colorName: CustomColors.blackColor,
//             //     fontSize: 13),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 EnquiryCheckBox(
//                   isChecked: isInsured,
//                   onChanged: (value) {
//                     setState(() {
//                       isInsured = value;
//                     });
//                   },
//                 ),
//                 const SizedBox(width: 40),
//                 if (isInsured) ...[
//                   Expanded(
//                       child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           HeadingText(
//                               heading: 'Insurance Company',
//                               colorName: CustomColors.blackColor,
//                               fontSize: 13),
//                           const SizedBox(width: 05),
//                           HeadingText(
//                               heading: '*',
//                               colorName: CustomColors.redColor,
//                               fontSize: 13),
//                         ],
//                       ),
//                       const SizedBox(height: 05),
//                       const InsuranceDropdownField(
//                         hintText: 'Select Insurance company',
//                       ),
//     // SearchDropdown<String>(
//     // value: selectedInsuranceCompany,
//     // items: insuranceCompany
//     //     .map((company) => DropdownItem<String>(
//     // value: company['id'].toString(),
//     // label: company['name'],
//     // ))
//     //     .toList(), // Ensure it's converted to a List
//     // onChanged: (value) => setState(() => selectedInsuranceCompany = value),
//     // hint: 'Select Item',
//     // width:250,
//     // )
//                     ],
//                   )),
//                   const SizedBox(width: 15),
//                   Expanded(
//                       child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           HeadingText(
//                               heading: 'Police Report Number',
//                               colorName: CustomColors.blackColor,
//                               fontSize: 13),
//                           const SizedBox(width: 05),
//                           HeadingText(
//                               heading: '*',
//                               colorName: CustomColors.redColor,
//                               fontSize: 13),
//                         ],
//                       ),
//                       const SizedBox(height: 05),
//                       SizedBox(
//                           width: 380,
//                           child: TextFormField(
//                             controller: policeReportNoController,
//                             decoration:  InputDecoration(
//                               hintText: 'Police Report number',
//                               hintStyle: TextStyle(
//                                 color: CustomColors.textFormTextColor,
//                                 fontSize: 15,
//                                 fontFamily: 'PoppinsBold',
//                               ),
//                               filled: true,
//                               fillColor: CustomColors.whiteColor,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (isInsured && (value == null || value.isEmpty)) {
//                                 return "Required";
//                               }
//                               return null;
//                             },
//                           ),)
//                     ],
//                   )),
//                   const SizedBox(width: 15),
//                   Expanded(
//                       child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       HeadingText(
//                           heading: 'Policy Number',
//                           colorName: CustomColors.blackColor,
//                           fontSize: 13),
//                       const SizedBox(height: 05),
//                       SizedBox(
//                           width: 380,
//                           child: PolicyNoTextField(
//                             hint: 'Policy Number',
//                             controller: policyNoController, validator: (value ) {  },
//                           ))
//                     ],
//                   )),
//                 ]
//               ],
//             )
//           ],
//         ));
//   }
//
//   Future<void> fetchInsuranceCompanyData() async {
//     try {
//       final insuranceCompanyList = InsuranceCompanyList();
//       final data = await insuranceCompanyList.fetchInsuranceCompany(3);
//       setState(() {
//         insuranceCompany = data;
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error loading Insurance company :$e');
//       }
//     }
//   }
// }
