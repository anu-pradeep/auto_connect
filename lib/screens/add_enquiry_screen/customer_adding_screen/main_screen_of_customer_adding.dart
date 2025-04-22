//
// import 'package:auto_connect/screens/add_enquiry_screen/customer_adding_screen/cash_dropdown.dart';
// import 'package:auto_connect/screens/add_enquiry_screen/customer_adding_screen/phone_textfield.dart';
// import 'package:auto_connect/screens/add_enquiry_screen/customer_adding_screen/save_button.dart';
// import 'package:auto_connect/screens/add_enquiry_screen/customer_adding_screen/staff_dropdown.dart';
// import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
// import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
// import 'package:auto_connect/screens/common_custom_widgets/text_span_text.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../calendar_field.dart';
// import 'address_textfield.dart';
// import 'canel_elevated_button.dart';
// import 'customer_image_picker.dart';
// import 'customer_name_textfield.dart';
// import 'customer_type_dropdown.dart';
// import 'email_textfield.dart';
// import 'file_no_textfield.dart';
// import 'license_textfield.dart';
//
// // void main(){runApp(MaterialApp(home: MainScreenOfCustomerAdding(),));}
// class MainScreenOfCustomerAdding extends StatefulWidget {
//   const MainScreenOfCustomerAdding({super.key});
//
//   @override
//   State<MainScreenOfCustomerAdding> createState() =>
//       _MainScreenOfCustomerAddingState();
// }
//
// class _MainScreenOfCustomerAddingState
//     extends State<MainScreenOfCustomerAdding> {
//   final formKey = GlobalKey<FormState>();
//   String? selectCustomerType;
//   String? selectCustomerName;
//   String? selectPhoneNo;
//   String? selectEmailId;
//   String? selectedStaffList;
//   String? cashOrCard;
//
//   final TextEditingController customerNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController fileNoController = TextEditingController();
//   final TextEditingController licenseController = TextEditingController();
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//
//   void saveCustomerForm() {
//     if (formKey.currentState!.validate()) {
//       Navigator.pop(context); // Close dialog
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//         backgroundColor: CustomColors.whiteColor,
//         shape:
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//         contentPadding: const EdgeInsets.all(20),
//         content: Form(
//           key: formKey,
//           child: SizedBox(
//               width: 940,
//               height: 950,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     HeadingText(
//                         heading: 'Add Customer',
//                         colorName: CustomColors.blackColor,
//                         fontSize: 15),
//                     const SizedBox(height: 15),
//                     Row(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const CustomRichText(
//                               mainText: 'Customer type',
//                               highlightedText: '*',
//                             ),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                               width: 200,
//                               child: CustomerTypeDropdown(
//                                 hintText: 'customer type',
//                                 onItemSelected: (String Item) {
//                                   setState(() {
//                                     selectCustomerType = Item;
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (selectCustomerType == null ||
//                                       selectCustomerType!.isEmpty) {
//                                     return 'required';
//                                   }
//                                   return null;
//                                 }, items: [],
//                               ),
//                             ),
//                           ],
//                         ),
//                         // CustomerForm(),
//                         const SizedBox(width: 25),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const CustomRichText(
//                               mainText: 'Customer Name',
//                               highlightedText: '*',
//                             ),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                               width: 200,
//                               child: CustomerNameField(
//                                 controller: customerNameController,
//                                 validator: (value) {
//                                   if (selectCustomerName == null ||
//                                       selectCustomerName!.isEmpty) {
//                                     return 'required';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(width: 25),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const CustomRichText(
//                               mainText: 'Phone',
//                               highlightedText: '*',
//                             ),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                               width: 200,
//                               child: PhoneTextField(
//                                 controller: phoneController,
//                                 validator: (value) {
//                                   if (selectPhoneNo == null ||
//                                       selectPhoneNo!.isEmpty) {
//                                     return 'required';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(width: 25),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const CustomRichText(
//                               mainText: 'email',
//                               highlightedText: '*',
//                             ),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                               width: 200,
//                               child: emailTextField(
//                                 controller: emailController,
//                                 validator: (value) {
//                                   if (selectEmailId == null ||
//                                       selectEmailId!.isEmpty) {
//                                     return 'required';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             HeadingText(
//                               heading: 'File Number',
//                               colorName: CustomColors.blackColor,
//                               fontSize: 12,
//                             ),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                               width: 200,
//                               child: fileNoTextField(
//                                 controller: fileNoController,
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(width: 25),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const CustomRichText(
//                               mainText: 'Credit / Cash',
//                               highlightedText: '*',
//                             ),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                               width: 200,
//                               child: CashDropdown(
//                                   hintText: 'select',
//                                   onItemSelected: (String Item) {
//                                     setState(() {
//                                       cashOrCard = Item;
//                                     });
//                                   },
//                                   validator: (value) {
//                                     if (cashOrCard == null ||
//                                         cashOrCard!.isEmpty) {
//                                       return 'required';
//                                     }
//                                     return null;
//                                   }),
//                             )
//                           ],
//                         ),
//                         const SizedBox(width: 25),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             HeadingText(
//                               heading: ' License Number',
//                               colorName: CustomColors.blackColor,
//                               fontSize: 12,
//                             ),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                               width: 200,
//                               child: LicenseTexttField(
//                                 controller: licenseController,
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(width: 25),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             HeadingText(
//                                 heading: '   Trade License Expiry ',
//                                 colorName: CustomColors.blackColor,
//                                 fontSize: 12),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                                 width: 210,
//                                 child: CalendarTextField(
//                                   controller: dateController,
//                                   onTap: () {
//                                     selectDate(context, dateController);
//                                   },
//                                 ))
//                           ],
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             HeadingText(
//                               heading: 'Address',
//                               colorName: CustomColors.blackColor,
//                               fontSize: 12,
//                             ),
//                             const SizedBox(height: 10),
//                             SizedBox(
//                                 width: 650,
//                                 child: AddressTextField(
//                                   controller: addressController,
//                                 )),
//                           ],
//                         ),
//                         const SizedBox(width: 25),
//                         SizedBox(
//                             width: 210,
//                             child: StaffListDropdown(
//                               hintText: 'Follow up Staff',
//                               onItemSelected: (String) {},
//                             ))
//                       ],
//                     ),
//                     const CustomerImagePicker(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         ElevatedCancelButton(
//                           onClick: () {
//                             customerNameController.clear();
//                             phoneController.clear();
//                             emailController.clear();
//                             setState(() {
//                               selectCustomerType = null;
//                               cashOrCard = null;
//                             });
//
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         const SizedBox(width: 10),
//                         CustomerSaveButton(
//                           onClick: saveCustomerForm,
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               )),
//         ));
//   }
//
//   Future<void> selectDate(
//       BuildContext context, TextEditingController controller) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData(
//             colorScheme: ColorScheme.light(
//               primary: CustomColors.borderColor,
//               onPrimary: CustomColors.whiteColor,
//               onSurface: CustomColors.blackColor,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: CustomColors.borderColor,
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null) {
//       setState(() {
//         controller.text = DateFormat('dd-MM-yyyy').format(picked);
//       });
//     }
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // without ui changes
// // import 'package:auto_connect/screens/add_enquiry_screen/customer_adding_screen/cash_dropdown.dart';
// // import 'package:auto_connect/screens/add_enquiry_screen/customer_adding_screen/phone_textfield.dart';
// // import 'package:auto_connect/screens/add_enquiry_screen/customer_adding_screen/save_button.dart';
// // import 'package:auto_connect/screens/add_enquiry_screen/customer_adding_screen/staff_dropdown.dart';
// // import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
// // import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
// // import 'package:auto_connect/screens/common_custom_widgets/text_span_text.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import '../calendar_field.dart';
// // import 'address_textfield.dart';
// // import 'canel_elevated_button.dart';
// // import 'customer_image_picker.dart';
// // import 'customer_name_textfield.dart';
// // import 'customer_type_dropdown.dart';
// // import 'email_textfield.dart';
// // import 'file_no_textfield.dart';
// // import 'license_textfield.dart';
// //
// // // void main(){runApp(MaterialApp(home: MainScreenOfCustomerAdding(),));}
// // class MainScreenOfCustomerAdding extends StatefulWidget {
// //   const MainScreenOfCustomerAdding({super.key});
// //
// //   @override
// //   State<MainScreenOfCustomerAdding> createState() =>
// //       _MainScreenOfCustomerAddingState();
// // }
// //
// // class _MainScreenOfCustomerAddingState
// //     extends State<MainScreenOfCustomerAdding> {
// //   final formKey = GlobalKey<FormState>();
// //   String? selectCustomerType;
// //   String? selectCustomerName;
// //   String? selectPhoneNo;
// //   String? selectEmailId;
// //   String? selectedStaffList;
// //   String? cashOrCard;
// //
// //   final TextEditingController customerNameController = TextEditingController();
// //   final TextEditingController phoneController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController fileNoController = TextEditingController();
// //   final TextEditingController licenseController = TextEditingController();
// //   final TextEditingController dateController = TextEditingController();
// //   final TextEditingController addressController = TextEditingController();
// //
// //   void saveCustomerForm() {
// //     if (formKey.currentState!.validate()) {
// //       Navigator.pop(context); // Close dialog
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return AlertDialog(
// //         backgroundColor: CustomColors.whiteColor,
// //         shape:
// //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
// //         contentPadding: const EdgeInsets.all(20),
// //         content: Form(
// //           key: formKey,
// //           child: SizedBox(
// //               width: 940,
// //               height: 950,
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     HeadingText(
// //                         heading: 'Add Customer',
// //                         colorName: CustomColors.blackColor,
// //                         fontSize: 15),
// //                     const SizedBox(height: 15),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.start,
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const CustomRichText(
// //                               mainText: 'Customer type',
// //                               highlightedText: '*',
// //                             ),
// //                             const SizedBox(height: 10),
// //                             SizedBox(
// //                               width: 200,
// //                               child: CustomerTypeDropdown(
// //                                 hintText: 'customer type',
// //                                 onItemSelected: (String Item) {
// //                                   setState(() {
// //                                     selectCustomerType = Item;
// //                                   });
// //                                 },
// //                                 validator: (value) {
// //                                   if (selectCustomerType == null ||
// //                                       selectCustomerType!.isEmpty) {
// //                                     return 'required';
// //                                   }
// //                                   return null;
// //                                 }, items: [],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         // CustomerForm(),
// //                         const SizedBox(width: 25),
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const CustomRichText(
// //                               mainText: 'Customer Name',
// //                               highlightedText: '*',
// //                             ),
// //                             const SizedBox(height: 10),
// //                             SizedBox(
// //                               width: 200,
// //                               child: CustomerNameField(
// //                                 controller: customerNameController,
// //                                 validator: (value) {
// //                                   if (selectCustomerName == null ||
// //                                       selectCustomerName!.isEmpty) {
// //                                     return 'required';
// //                                   }
// //                                   return null;
// //                                 },
// //                               ),
// //                             )
// //                           ],
// //                         ),
// //                         const SizedBox(width: 25),
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const CustomRichText(
// //                               mainText: 'Phone',
// //                               highlightedText: '*',
// //                             ),
// //                             const SizedBox(height: 10),
// //                             SizedBox(
// //                               width: 200,
// //                               child: PhoneTextField(
// //                                 controller: phoneController,
// //                                 validator: (value) {
// //                                   if (selectPhoneNo == null ||
// //                                       selectPhoneNo!.isEmpty) {
// //                                     return 'required';
// //                                   }
// //                                   return null;
// //                                 },
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const SizedBox(width: 25),
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const CustomRichText(
// //                               mainText: 'email',
// //                               highlightedText: '*',
// //                             ),
// //                             const SizedBox(height: 10),
// //                             SizedBox(
// //                               width: 200,
// //                               child: emailTextField(
// //                                 controller: emailController,
// //                                 validator: (value) {
// //                                   if (selectEmailId == null ||
// //                                       selectEmailId!.isEmpty) {
// //                                     return 'required';
// //                                   }
// //                                   return null;
// //                                 },
// //                               ),
// //                             )
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 10),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.start,
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             HeadingText(
// //                               heading: 'File Number',
// //                               colorName: CustomColors.blackColor,
// //                               fontSize: 12,
// //                             ),
// //                             const SizedBox(height: 10),
// //                             SizedBox(
// //                               width: 200,
// //                               child: fileNoTextField(
// //                                 controller: fileNoController,
// //                               ),
// //                             )
// //                           ],
// //                         ),
// //                         const SizedBox(width: 25),
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const CustomRichText(
// //                               mainText: 'Credit / Cash',
// //                               highlightedText: '*',
// //                             ),
// //                             const SizedBox(height: 10),
// //                             SizedBox(
// //                               width: 200,
// //                               child: CashDropdown(
// //                                   hintText: 'select',
// //                                   onItemSelected: (String Item) {
// //                                     setState(() {
// //                                       cashOrCard = Item;
// //                                     });
// //                                   },
// //                                   validator: (value) {
// //                                     if (cashOrCard == null ||
// //                                         cashOrCard!.isEmpty) {
// //                                       return 'required';
// //                                     }
// //                                     return null;
// //                                   }),
// //                             )
// //                           ],
// //                         ),
// //                         const SizedBox(width: 25),
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             HeadingText(
// //                               heading: ' License Number',
// //                               colorName: CustomColors.blackColor,
// //                               fontSize: 12,
// //                             ),
// //                             const SizedBox(height: 10),
// //                             SizedBox(
// //                               width: 200,
// //                               child: LicenseTexttField(
// //                                 controller: licenseController,
// //                               ),
// //                             )
// //                           ],
// //                         ),
// //                         const SizedBox(width: 25),
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             HeadingText(
// //                                 heading: '   Trade License Expiry ',
// //                                 colorName: CustomColors.blackColor,
// //                                 fontSize: 12),
// //                             const SizedBox(height: 10),
// //                             SizedBox(
// //                                 width: 210,
// //                                 child: CalendarTextField(
// //                                   controller: dateController,
// //                                   onTap: () {
// //                                     selectDate(context, dateController);
// //                                   },
// //                                 ))
// //                           ],
// //                         )
// //                       ],
// //                     ),
// //                     const SizedBox(height: 10),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.start,
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             HeadingText(
// //                               heading: 'Address',
// //                               colorName: CustomColors.blackColor,
// //                               fontSize: 12,
// //                             ),
// //                             const SizedBox(height: 10),
// //                             SizedBox(
// //                                 width: 650,
// //                                 child: AddressTextField(
// //                                   controller: addressController,
// //                                 )),
// //                           ],
// //                         ),
// //                         const SizedBox(width: 25),
// //                         SizedBox(
// //                             width: 210,
// //                             child: StaffListDropdown(
// //                               hintText: 'Follow up Staff',
// //                               onItemSelected: (String) {},
// //                             ))
// //                       ],
// //                     ),
// //                     const CustomerImagePicker(),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.end,
// //                       children: [
// //                         ElevatedCancelButton(
// //                           onClick: () {
// //                             customerNameController.clear();
// //                             phoneController.clear();
// //                             emailController.clear();
// //                             setState(() {
// //                               selectCustomerType = null;
// //                               cashOrCard = null;
// //                             });
// //
// //                             Navigator.of(context).pop();
// //                           },
// //                         ),
// //                         const SizedBox(width: 10),
// //                         CustomerSaveButton(
// //                           onClick: saveCustomerForm,
// //                         )
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               )),
// //         ));
// //   }
// //
// //   Future<void> selectDate(
// //       BuildContext context, TextEditingController controller) async {
// //     DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(2000),
// //       lastDate: DateTime(2101),
// //       builder: (BuildContext context, Widget? child) {
// //         return Theme(
// //           data: ThemeData(
// //             colorScheme: ColorScheme.light(
// //               primary: CustomColors.borderColor,
// //               onPrimary: CustomColors.whiteColor,
// //               onSurface: CustomColors.blackColor,
// //             ),
// //             textButtonTheme: TextButtonThemeData(
// //               style: TextButton.styleFrom(
// //                 foregroundColor: CustomColors.borderColor,
// //               ),
// //             ),
// //           ),
// //           child: child!,
// //         );
// //       },
// //     );
// //     if (picked != null) {
// //       setState(() {
// //         controller.text = DateFormat('dd-MM-yyyy').format(picked);
// //       });
// //     }
// //   }
// // }
