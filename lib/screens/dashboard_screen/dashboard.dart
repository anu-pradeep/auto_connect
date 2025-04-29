import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:auto_connect/screens/dashboard_screen/row_with_cards.dart';
import 'package:flutter/material.dart';

import '../common_custom_widgets/drawer.dart';
import '../common_custom_widgets/appbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: const CustomAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: HeadingText(
                    heading: 'Dashboard',
                    colorName: CustomColors.blackColor,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 15),
                  child: HeadingText(
                    heading: 'Home - Dashboard',
                    colorName: CustomColors.borderColor,
                    fontSize: 13,
                  ),
                ),
                const CardRows()


              ],
            ),
          ),
        ),
      ),
    );
  }
}
