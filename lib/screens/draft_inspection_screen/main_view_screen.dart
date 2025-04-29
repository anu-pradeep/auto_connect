import 'package:auto_connect/screens/draft_inspection_screen/parts_container_widgets/parts_container_three.dart';
import 'package:auto_connect/screens/draft_inspection_screen/services_container_widgets/service_container.dart';
import 'package:auto_connect/screens/draft_inspection_screen/top_elevated_button.dart';
import 'package:flutter/material.dart';

import '../common_custom_widgets/appbar.dart';
import '../common_custom_widgets/colors.dart';
import '../common_custom_widgets/custom_heading_text.dart';
import '../common_custom_widgets/drawer.dart';
import 'body_container_first.dart';


class MainViewScreen extends StatefulWidget {
  const MainViewScreen({super.key});

  @override
  State<MainViewScreen> createState() => _MainViewScreenState();
}

class _MainViewScreenState extends State<MainViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  HeadingText(
                      heading: 'Inspections',
                      colorName: CustomColors.blackColor,
                      fontSize: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 850),
                    child: InspectDraftButton(
                      onClick: () {},
                      butColor: CustomColors.redColor,
                      texColor: CustomColors.whiteColor,
                      elevText: 'view Enquiry',
                    ),
                  ),
                  const SizedBox(width: 15),
                  InspectDraftButton(
                    onClick: () {},
                    butColor: CustomColors.redColor,
                    texColor: CustomColors.whiteColor,
                    elevText: 'All Enquiries',
                  ),
                ],
              ),
              HeadingText(
                  heading: 'Home - Enquiries',
                  colorName: CustomColors.borderColor,
                  fontSize: 13),
              const SizedBox(height: 18),
              const BodyContainer(),
              const SizedBox(height: 18),
              const ServiceContainer(),
              const SizedBox(height: 18),
              const PartsContainer(),
              const SizedBox(height: 18),
              // AddOperationMainContainer()

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InspectDraftButton(
                    onClick: () {},
                    butColor: CustomColors.whiteColor,
                    texColor: CustomColors.blackColor,
                    elevText: 'Cancel',
                  ),
                  const SizedBox(width: 15),
                  InspectDraftButton(
                    onClick: () {},
                    butColor: CustomColors.redColor,
                    texColor: CustomColors.whiteColor,
                    elevText: 'Quotation',
                  ),
                  const SizedBox(width: 15),
                  InspectDraftButton(
                    onClick: () {},
                    butColor: CustomColors.redColor,
                    texColor: CustomColors.whiteColor,
                    elevText: 'Job',
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
