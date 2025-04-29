import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:auto_connect/screens/common_custom_widgets/drawer.dart';
import 'package:auto_connect/screens/common_custom_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../add_enquiry_screen/elevated_button.dart';
import '../add_enquiry_screen/enquiry_adding_screen.dart';
import '../common_custom_widgets/colors.dart';
import 'enquiry_container.dart';


class MainEnquiryScreen extends StatefulWidget {
  const MainEnquiryScreen({super.key});

  @override
  State<MainEnquiryScreen> createState() => _MainEnquiryScreenState();
}

class _MainEnquiryScreenState extends State<MainEnquiryScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: const CustomAppbar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  HeadingText(heading: 'Enquiries',
                      colorName: CustomColors.blackColor,
                      fontSize: 20.sp),
                  Padding(
                    padding: const EdgeInsets.only(left: 975),
                    child: EnquirySaveButton(
                      onClick: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const EnquiryAddingScreen()));
                      },
                      butColor: CustomColors.redColor,
                      texColor: CustomColors.whiteColor,
                      elevText: 'Add Enquiry',
                    ),
                  ),
                ],
              ),
              HeadingText(heading: 'Home - Enquiries',
                  colorName: CustomColors.borderColor,
                  fontSize: 13.sp),
              const SizedBox(height: 18),
              const MainEnquiryContainer()
            ],
          ),
        ),
      )),
    );
  }
}
