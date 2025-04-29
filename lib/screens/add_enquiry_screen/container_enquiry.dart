

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
