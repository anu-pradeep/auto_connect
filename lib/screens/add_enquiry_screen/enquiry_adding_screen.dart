import 'package:flutter/material.dart';
import '../Enquiry_screen/main_enquiry_screen.dart';
import '../common_custom_widgets/colors.dart';
import '../common_custom_widgets/custom_heading_text.dart';
import '../common_custom_widgets/drawer.dart';
import '../common_custom_widgets/appbar.dart';
import 'container_enquiry.dart';
import 'elevated_button.dart';


class EnquiryAddingScreen extends StatefulWidget {
  const EnquiryAddingScreen({super.key});

  @override
  State<EnquiryAddingScreen> createState() => _EnquiryAddingScreenState();
}

class _EnquiryAddingScreenState extends State<EnquiryAddingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: const CustomAppbar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  HeadingText(
                      heading: 'Enquiry',
                      colorName: CustomColors.blackColor,
                      fontSize: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 1030),
                    child: EnquirySaveButton(
                      onClick: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainEnquiryScreen()));

                      },
                      butColor: CustomColors.redColor,
                      texColor: CustomColors.whiteColor,
                      elevText: 'View enquiries',
                    ),
                  )
                ],
              ),
              HeadingText(
                  heading: 'Home - Enquiries',
                  colorName: CustomColors.borderColor,
                  fontSize: 13),
              const SizedBox(height: 18),
              const EnquiryContainer(),

            ],
          ),
        ),
      )),
    );
  }
}
