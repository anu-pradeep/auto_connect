// import 'package:flutter/material.dart';
//
// class DetailsScreen extends StatelessWidget {
//   final String customerId;
//   // final String vehicleId;
//   final bool isInsured;
//   final String? insuranceId;
//   final String? policyNumber;
//   final String? policeReport;
//
//   const DetailsScreen({
//     Key? key,
//     required this.customerId,
//     // required this.vehicleId,
//     required this.isInsured,
//     this.insuranceId,
//     this.policyNumber,
//     this.policeReport,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Inspection ",),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Customer ID: $customerId"),
//             // Text("Vehicle ID: $vehicleId"),
//             Text("Is Insured: ${isInsured ? 'Yes' : 'No'}"),
//             if (isInsured) ...[
//               Text("Insurance ID: $insuranceId"),
//               Text("Policy Number: $policyNumber"),
//               Text("Police Report: $policeReport"),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
