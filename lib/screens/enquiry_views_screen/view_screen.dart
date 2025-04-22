import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class EnquiryViewScreen extends StatefulWidget {
  const EnquiryViewScreen({super.key});

  @override
  State<EnquiryViewScreen> createState() => _EnquiryViewScreenState();
}

class _EnquiryViewScreenState extends State<EnquiryViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: const Center(
        child: Text('Enquiry View Screen'),
      ),
    );
  }
}
