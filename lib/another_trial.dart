// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// //
// // void main() {
// //   runApp(MaterialApp(
// //     home: MainScreenOfCustomerAdding(),
// //   ));
// // }
// //
// // class MainScreenOfCustomerAdding extends StatefulWidget {
// //   const MainScreenOfCustomerAdding({Key? key}) : super(key: key);
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
// //   final TextEditingController customerNameController = TextEditingController();
// //   final TextEditingController phoneController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController fileNoController = TextEditingController();
// //   final TextEditingController licenseController = TextEditingController();
// //   final TextEditingController dateController = TextEditingController();
// //   final TextEditingController addressController = TextEditingController();
// //   String? cashOrCard;
// //
// //   void saveCustomerForm() {
// //     if (formKey.currentState!.validate()) {
// //       // If all validations pass, navigate to the next screen
// //       Navigator.pop(context); // Close dialog
// //     }
// //   }
// //
// //   void _showCustomerFormDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           backgroundColor: Colors.white,
// //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
// //           contentPadding: const EdgeInsets.all(20),
// //           content: Form(
// //             key: formKey,
// //             child: SizedBox(
// //               width: 940,
// //               height: 800,
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       'Add Customer',
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),
// //
// //                     // Customer Type Dropdown - Always visible
// //                     Row(
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             RichText(
// //                               text: TextSpan(
// //                                 children: [
// //                                   TextSpan(
// //                                     text: 'Customer type',
// //                                     style: TextStyle(color: Colors.black),
// //                                   ),
// //                                   TextSpan(
// //                                     text: ' *',
// //                                     style: TextStyle(color: Colors.red),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                             const SizedBox(height: 10),
// //                             // SizedBox(
// //                             //   width: 200,
// //                             //   child: _buildDropdown(
// //                             //     value: selectCustomerType,
// //                             //     hint: 'Select a customer type',
// //                             //     items: const [
// //                             //       DropdownMenuItem(value: 'individual', child: Text('Individual Customer')),
// //                             //       DropdownMenuItem(value: 'corporate', child: Text('Corporate Customer')),
// //                             //     ],
// //                             //     onChanged: (value) {
// //                             //       setState(() {
// //                             //         selectCustomerType = value;
// //                             //       });
// //                             //     },
// //                             //   ),
// //                             // ),
// //                             SizedBox(
// //                               width: 200,
// //                               child: _buildDropdown(
// //                                 value: selectCustomerType,
// //                                 hint: 'Select a customer type',
// //                                 items: const [
// //                                   DropdownMenuItem(value: 'individual', child: Text('Individual Customer')),
// //                                   DropdownMenuItem(value: 'corporate', child: Text('Corporate Customer')),
// //                                 ],
// //                                 onChanged: (value) {
// //                                   setState(() {
// //                                     selectCustomerType = value;
// //                                   });
// //                                 },
// //                                 validator: (value) {
// //                                   if (value == null || value.isEmpty) {
// //                                     return 'Please select a customer type';
// //                                   }
// //                                   return null;
// //                                 },
// //                               ),
// //                             ),
// //
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 20),
// //
// //                     // Fields that change based on customer type
// //                     if (selectCustomerType == 'individual') ...[
// //                       Row(
// //                         children: [
// //                           _buildFormField(
// //                             label: 'Care Of',
// //                             isRequired: true,
// //                             width: 200,
// //                             child: _buildDropdown(
// //                               hint: '-- Select Care Of --',
// //                               items: const [],
// //                               onChanged: (value) {},
// //                             ),
// //                           ),
// //                           const SizedBox(width: 25),
// //                           _buildFormField(
// //                             label: 'Customer Name',
// //                             isRequired: true,
// //                             width: 200,
// //                             child: TextFormField(
// //                               controller: customerNameController,
// //                               decoration: _inputDecoration('Customer name'),
// //                               validator: _requiredValidator,
// //                             ),
// //                           ),
// //                           const SizedBox(width: 25),
// //                           _buildFormField(
// //                             label: 'Phone',
// //                             isRequired: true,
// //                             width: 200,
// //                             child: TextFormField(
// //                               controller: phoneController,
// //                               decoration: _inputDecoration('Customer phone'),
// //                               keyboardType: TextInputType.phone,
// //                               validator: _requiredValidator,
// //                             ),
// //                           ),
// //                           const SizedBox(width: 25),
// //                           _buildFormField(
// //                             label: 'Email',
// //                             isRequired: true,
// //                             width: 200,
// //                             child: TextFormField(
// //                               controller: emailController,
// //                               decoration: _inputDecoration('Customer email'),
// //                               keyboardType: TextInputType.emailAddress,
// //                               validator: _requiredValidator,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ] else if (selectCustomerType == 'corporate') ...[
// //                       Row(
// //                         children: [
// //                           _buildFormField(
// //                             label: 'Customer Name',
// //                             isRequired: true,
// //                             width: 200,
// //                             child: TextFormField(
// //                               controller: customerNameController,
// //                               decoration: _inputDecoration('Customer name'),
// //                               validator: _requiredValidator,
// //                             ),
// //                           ),
// //                           const SizedBox(width: 25),
// //                           _buildFormField(
// //                             label: 'Phone',
// //                             isRequired: true,
// //                             width: 200,
// //                             child: TextFormField(
// //                               controller: phoneController,
// //                               decoration: _inputDecoration('Customer phone'),
// //                               keyboardType: TextInputType.phone,
// //                               validator: _requiredValidator,
// //                             ),
// //                           ),
// //                           const SizedBox(width: 25),
// //                           _buildFormField(
// //                             label: 'Email',
// //                             isRequired: true,
// //                             width: 200,
// //                             child: TextFormField(
// //                               controller: emailController,
// //                               decoration: _inputDecoration('Customer email'),
// //                               keyboardType: TextInputType.emailAddress,
// //                               validator: _requiredValidator,
// //                             ),
// //                           ),
// //                           const SizedBox(width: 25),
// //                           _buildFormField(
// //                             label: 'Contact Person',
// //                             isRequired: true,
// //                             width: 200,
// //                             child: TextFormField(
// //                               decoration: _inputDecoration('Contact Person'),
// //                               validator: _requiredValidator,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 10),
// //                       Row(
// //                         children: [
// //                           _buildFormField(
// //                             label: 'Contact 1',
// //                             isRequired: true,
// //                             width: 200,
// //                             child: TextFormField(
// //                               decoration: _inputDecoration('Contact 1'),
// //                               validator: _requiredValidator,
// //                             ),
// //                           ),
// //                           const SizedBox(width: 25),
// //                           _buildFormField(
// //                             label: 'Contact 2',
// //                             isRequired: false,
// //                             width: 200,
// //                             child: TextFormField(
// //                               decoration: _inputDecoration('Contact 2'),
// //                             ),
// //                           ),
// //                           const SizedBox(width: 25),
// //                           _buildFormField(
// //                             label: 'Website',
// //                             isRequired: false,
// //                             width: 200,
// //                             child: TextFormField(
// //                               decoration: _inputDecoration('Customer website URL'),
// //                               keyboardType: TextInputType.url,
// //                             ),
// //                           ),
// //                           const SizedBox(width: 25),
// //                           _buildFormField(
// //                             label: 'File Number',
// //                             isRequired: false,
// //                             width: 200,
// //                             child: TextFormField(
// //                               controller: fileNoController,
// //                               decoration: _inputDecoration('File Number'),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //
// //                     // Common fields for both types
// //                     const SizedBox(height: 20),
// //                     Row(
// //                       children: [
// //                         _buildFormField(
// //                           label: 'Credit / Cash',
// //                           isRequired: true,
// //                           width: 200,
// //                           child: _buildDropdown(
// //                             value: cashOrCard,
// //                             hint: 'Select',
// //                             items: const [
// //                               DropdownMenuItem(value: 'credit', child: Text('Credit')),
// //                               DropdownMenuItem(value: 'cash', child: Text('Cash')),
// //                             ],
// //                             onChanged: (value) {
// //                               setState(() {
// //                                 cashOrCard = value;
// //                               });
// //                             },
// //                           ),
// //                         ),
// //                         const SizedBox(width: 25),
// //                         _buildFormField(
// //                           label: 'License Number',
// //                           isRequired: false,
// //                           width: 200,
// //                           child: TextFormField(
// //                             controller: licenseController,
// //                             decoration: _inputDecoration('License Number'),
// //                           ),
// //                         ),
// //                         const SizedBox(width: 25),
// //                         _buildFormField(
// //                           label: 'Trade License Expiry',
// //                           isRequired: false,
// //                           width: 200,
// //                           child: TextFormField(
// //                             controller: dateController,
// //                             decoration: _inputDecoration('dd-mm-yyyy').copyWith(
// //                               suffixIcon: IconButton(
// //                                 icon: const Icon(Icons.calendar_today),
// //                                 onPressed: () {
// //                                   _selectDate(context, dateController);
// //                                 },
// //                               ),
// //                             ),
// //                             readOnly: true,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 10),
// //                     _buildFormField(
// //                       label: 'Address',
// //                       isRequired: false,
// //                       width: 650,
// //                       child: TextFormField(
// //                         controller: addressController,
// //                         decoration: _inputDecoration('Customer address'),
// //                         maxLines: 4,
// //                       ),
// //                     ),
// //
// //                     // Buttons
// //                     const SizedBox(height: 20),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.end,
// //                       children: [
// //                         ElevatedButton(
// //                           onPressed: () {
// //                             customerNameController.clear();
// //                             phoneController.clear();
// //                             emailController.clear();
// //                             setState(() {
// //                               selectCustomerType = null;
// //                               cashOrCard = null;
// //                             });
// //                             Navigator.of(context).pop();
// //                           },
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor: Colors.grey[300],
// //                             foregroundColor: Colors.black,
// //                           ),
// //                           child: const Text('Cancel'),
// //                         ),
// //                         const SizedBox(width: 10),
// //                         ElevatedButton(
// //                           onPressed: saveCustomerForm,
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor: Colors.blue,
// //                             foregroundColor: Colors.white,
// //                           ),
// //                           child: const Text('Save Customer'),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Customer Management'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: _showCustomerFormDialog,
// //           child: const Text('Add New Customer'),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Helper method to build form fields with proper formatting
// //   Widget _buildFormField({
// //     required String label,
// //     required bool isRequired,
// //     required Widget child,
// //     required double width,
// //   }) {
// //     return SizedBox(
// //       width: width,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           RichText(
// //             text: TextSpan(
// //               children: [
// //                 TextSpan(
// //                   text: label,
// //                   style: TextStyle(color: Colors.black),
// //                 ),
// //                 if (isRequired)
// //                   TextSpan(
// //                     text: ' *',
// //                     style: TextStyle(color: Colors.red),
// //                   ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 6),
// //           child,
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Helper method to create consistent input decorations
// //   InputDecoration _inputDecoration(String hint) {
// //     return InputDecoration(
// //       hintText: hint,
// //       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
// //       border: OutlineInputBorder(
// //         borderRadius: BorderRadius.circular(4),
// //       ),
// //       enabledBorder: OutlineInputBorder(
// //         borderRadius: BorderRadius.circular(4),
// //         borderSide: BorderSide(color: Colors.grey[300]!),
// //       ),
// //       focusedBorder: OutlineInputBorder(
// //         borderRadius: BorderRadius.circular(4),
// //         borderSide: BorderSide(color: Colors.blue[300]!, width: 2),
// //       ),
// //     );
// //   }
// //
// //   // Helper method to build dropdown
// //   Widget _buildDropdown({
// //     String? value,
// //     String? hint,
// //     required List<DropdownMenuItem<String>> items,
// //     required void Function(String?)? onChanged,
// //     String? Function(String?)? validator, // Added validator
// //   }) {
// //     return DropdownButtonFormField<String>(
// //       value: value,
// //       hint: hint != null ? Text(hint) : null,
// //       items: items,
// //       onChanged: onChanged,
// //       validator: validator, // Apply the validator
// //       decoration: InputDecoration(
// //         contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(4),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(4),
// //           borderSide: BorderSide(color: Colors.grey[300]!),
// //         ),
// //         focusedBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(4),
// //           borderSide: BorderSide(color: Colors.blue[300]!, width: 2),
// //         ),
// //       ),
// //       isExpanded: true,
// //     );
// //   }
// //
// //   // Date picker function
// //   Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
// //     final DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(2000),
// //       lastDate: DateTime(2101),
// //       builder: (BuildContext context, Widget? child) {
// //         return Theme(
// //           data: ThemeData(
// //             colorScheme: ColorScheme.light(
// //               primary: Colors.blue,
// //               onPrimary: Colors.white,
// //               onSurface: Colors.black,
// //             ),
// //             textButtonTheme: TextButtonThemeData(
// //               style: TextButton.styleFrom(
// //                 foregroundColor: Colors.blue,
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
// //
// //   }
// //
// // // Validation function
// // // Validation function for required fields
// //   String? _requiredValidator(String? value) {
// //     if (value == null || value.isEmpty) {
// //       return 'This field is required';
// //     }
// //     return null;
// //   }}
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: HomeScreen(),
//   ));
// }
//
// // Home Screen - This represents your "another screen"
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Show the customer form dialog from any screen
//             showCustomerFormDialog(context);
//           },
//           child: const Text('Add New Customer'),
//         ),
//       ),
//     );
//   }
// }
//
// // Function to show the customer form dialog
// void showCustomerFormDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return CustomerFormDialog();
//     },
//   );
// }
//
// // Custom Dialog Widget
// class CustomerFormDialog extends StatefulWidget {
//   const CustomerFormDialog({Key? key}) : super(key: key);
//
//   @override
//   State<CustomerFormDialog> createState() => _CustomerFormDialogState();
// }
//
// class _CustomerFormDialogState extends State<CustomerFormDialog> {
//   final formKey = GlobalKey<FormState>();
//   String? selectCustomerType;
//   final TextEditingController customerNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController fileNoController = TextEditingController();
//   final TextEditingController licenseController = TextEditingController();
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   String? cashOrCard;
//
//   void saveCustomerForm() {
//     if (formKey.currentState!.validate()) {
//       // If all validations pass, navigate to the next screen
//       Navigator.pop(context); // Close dialog
//
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//       contentPadding: const EdgeInsets.all(20),
//       content: Form(
//         key: formKey,
//         child: SizedBox(
//           width: 940,
//           height: 900,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Add Customer',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Customer Type Dropdown - Always visible
//                 Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'Customer type',
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                               TextSpan(
//                                 text: ' *',
//                                 style: TextStyle(color: Colors.red),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         SizedBox(
//                           width: 200,
//                           child: _buildDropdown(
//                             value: selectCustomerType,
//                             hint: 'Select a customer type',
//                             items: const [
//                               DropdownMenuItem(value: 'individual', child: Text('Individual Customer')),
//                               DropdownMenuItem(value: 'corporate', child: Text('Corporate Customer')),
//                             ],
//                             onChanged: (value) {
//                               setState(() {
//                                 selectCustomerType = value;
//                               });
//                             },
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please select a customer type';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Fields that change based on customer type
//                 if (selectCustomerType == 'individual') ...[
//                   Row(
//                     children: [
//                       _buildFormField(
//                         label: 'Care Of',
//                         isRequired: true,
//                         width: 200,
//                         child: _buildDropdown(
//                           hint: '-- Select Care Of --',
//                           items: const [],
//                           onChanged: (value) {},
//                         ),
//                       ),
//                       const SizedBox(width: 25),
//                       _buildFormField(
//                         label: 'Customer Name',
//                         isRequired: true,
//                         width: 200,
//                         child: TextFormField(
//                           controller: customerNameController,
//                           decoration: _inputDecoration('Customer name'),
//                           validator: _requiredValidator,
//                         ),
//                       ),
//                       const SizedBox(width: 25),
//                       _buildFormField(
//                         label: 'Phone',
//                         isRequired: true,
//                         width: 200,
//                         child: TextFormField(
//                           controller: phoneController,
//                           decoration: _inputDecoration('Customer phone'),
//                           keyboardType: TextInputType.phone,
//                           validator: _requiredValidator,
//                         ),
//                       ),
//                       const SizedBox(width: 25),
//                       _buildFormField(
//                         label: 'Email',
//                         isRequired: true,
//                         width: 200,
//                         child: TextFormField(
//                           controller: emailController,
//                           decoration: _inputDecoration('Customer email'),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: _requiredValidator,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ] else if (selectCustomerType == 'corporate') ...[
//                   Row(
//                     children: [
//                       _buildFormField(
//                         label: 'Customer Name',
//                         isRequired: true,
//                         width: 200,
//                         child: TextFormField(
//                           controller: customerNameController,
//                           decoration: _inputDecoration('Customer name'),
//                           validator: _requiredValidator,
//                         ),
//                       ),
//                       const SizedBox(width: 25),
//                       _buildFormField(
//                         label: 'Phone',
//                         isRequired: true,
//                         width: 200,
//                         child: TextFormField(
//                           controller: phoneController,
//                           decoration: _inputDecoration('Customer phone'),
//                           keyboardType: TextInputType.phone,
//                           validator: _requiredValidator,
//                         ),
//                       ),
//                       const SizedBox(width: 25),
//                       _buildFormField(
//                         label: 'Email',
//                         isRequired: true,
//                         width: 200,
//                         child: TextFormField(
//                           controller: emailController,
//                           decoration: _inputDecoration('Customer email'),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: _requiredValidator,
//                         ),
//                       ),
//                       const SizedBox(width: 25),
//                       _buildFormField(
//                         label: 'Contact Person',
//                         isRequired: true,
//                         width: 200,
//                         child: TextFormField(
//                           decoration: _inputDecoration('Contact Person'),
//                           validator: _requiredValidator,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       _buildFormField(
//                         label: 'Contact 1',
//                         isRequired: true,
//                         width: 200,
//                         child: TextFormField(
//                           decoration: _inputDecoration('Contact 1'),
//                           validator: _requiredValidator,
//                         ),
//                       ),
//                       const SizedBox(width: 25),
//                       _buildFormField(
//                         label: 'Contact 2',
//                         isRequired: false,
//                         width: 200,
//                         child: TextFormField(
//                           decoration: _inputDecoration('Contact 2'),
//                         ),
//                       ),
//                       const SizedBox(width: 25),
//                       _buildFormField(
//                         label: 'Website',
//                         isRequired: false,
//                         width: 200,
//                         child: TextFormField(
//                           decoration: _inputDecoration('Customer website URL'),
//                           keyboardType: TextInputType.url,
//                         ),
//                       ),
//                       const SizedBox(width: 25),
//                       _buildFormField(
//                         label: 'File Number',
//                         isRequired: false,
//                         width: 200,
//                         child: TextFormField(
//                           controller: fileNoController,
//                           decoration: _inputDecoration('File Number'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//
//                 // Common fields for both types
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     _buildFormField(
//                       label: 'Credit / Cash',
//                       isRequired: true,
//                       width: 200,
//                       child: _buildDropdown(
//                         value: cashOrCard,
//                         hint: 'Select',
//                         items: const [
//                           DropdownMenuItem(value: 'credit', child: Text('Credit')),
//                           DropdownMenuItem(value: 'cash', child: Text('Cash')),
//                         ],
//                         onChanged: (value) {
//                           setState(() {
//                             cashOrCard = value;
//                           });
//                         },
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please select an option';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     const SizedBox(width: 25),
//                     _buildFormField(
//                       label: 'License Number',
//                       isRequired: false,
//                       width: 200,
//                       child: TextFormField(
//                         controller: licenseController,
//                         decoration: _inputDecoration('License Number'),
//                       ),
//                     ),
//                     const SizedBox(width: 25),
//                     _buildFormField(
//                       label: 'Trade License Expiry',
//                       isRequired: false,
//                       width: 200,
//                       child: TextFormField(
//                         controller: dateController,
//                         decoration: _inputDecoration('dd-mm-yyyy').copyWith(
//                           suffixIcon: IconButton(
//                             icon: const Icon(Icons.calendar_today),
//                             onPressed: () {
//                               _selectDate(context, dateController);
//                             },
//                           ),
//                         ),
//                         readOnly: true,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 _buildFormField(
//                   label: 'Address',
//                   isRequired: false,
//                   width: 650,
//                   child: TextFormField(
//                     controller: addressController,
//                     decoration: _inputDecoration('Customer address'),
//                     maxLines: 4,
//                   ),
//                 ),
//
//                 // Buttons
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.grey[300],
//                         foregroundColor: Colors.black,
//                       ),
//                       child: const Text('Cancel'),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: saveCustomerForm,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                       ),
//                       child: const Text('Save Customer'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build form fields with proper formatting
//   Widget _buildFormField({
//     required String label,
//     required bool isRequired,
//     required Widget child,
//     required double width,
//   }) {
//     return SizedBox(
//       width: width,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: label,
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 if (isRequired)
//                   TextSpan(
//                     text: ' *',
//                     style: TextStyle(color: Colors.red),
//                   ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 6),
//           child,
//         ],
//       ),
//     );
//   }
//
//   // Helper method to create consistent input decorations
//   InputDecoration _inputDecoration(String hint) {
//     return InputDecoration(
//       hintText: hint,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: BorderSide(color: Colors.grey[300]!),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: BorderSide(color: Colors.blue[300]!, width: 2),
//       ),
//     );
//   }
//
//   // Helper method to build dropdown
//   Widget _buildDropdown({
//     String? value,
//     String? hint,
//     required List<DropdownMenuItem<String>> items,
//     required void Function(String?)? onChanged,
//     String? Function(String?)? validator,
//   }) {
//     return DropdownButtonFormField<String>(
//       value: value,
//       hint: hint != null ? Text(hint) : null,
//       items: items,
//       onChanged: onChanged,
//       validator: validator,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(04),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(04),
//           borderSide: BorderSide(color: Colors.grey[300]!),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(4),
//           borderSide: BorderSide(color: Colors.blue[300]!, width: 2),
//         ),
//       ),
//       isExpanded: true,
//     );
//   }
//
//   // Date picker function
//   Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData(
//             colorScheme: ColorScheme.light(
//               primary: Colors.blue,
//               onPrimary: Colors.white,
//               onSurface: Colors.black,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.blue,
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
//
//   // Validation function for required fields
//   String? _requiredValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'This field is required';
//     }
//     return null;
//   }
// }