import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:auto_connect/screens/common_custom_widgets/drawer.dart';
import 'package:auto_connect/screens/common_custom_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_custom_widgets/colors.dart';
import 'job_container.dart';
class MainJobScreen extends StatefulWidget {
  const MainJobScreen({super.key});

  @override
  State<MainJobScreen> createState() => _MainJobScreenState();
}

class _MainJobScreenState extends State<MainJobScreen> {
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
              HeadingText(
                  heading: 'Jobs',
                  colorName: CustomColors.blackColor,
                  fontSize: 16.sp),
              HeadingText(
                  heading: 'Home - Jobs',
                  colorName: CustomColors.borderColor,
                  fontSize: 13.sp),
              const SizedBox(height: 18),
              const JobScreenContainer()
            ],
          ),
        ),
      )),
    );
  }
}
