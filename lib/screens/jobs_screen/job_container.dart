import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:auto_connect/screens/jobs_screen/job_dropdown.dart';
import 'package:flutter/material.dart';
import 'job_gridview.dart';
import 'job_textform.dart';

class JobScreenContainer extends StatefulWidget {
  const JobScreenContainer({super.key});

  @override
  State<JobScreenContainer> createState() => _JobScreenContainerState();
}

class _JobScreenContainerState extends State<JobScreenContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),

      ),
      height: 550,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width:380,child: JobTextForm(jobText: 'Keyword',)),
                SizedBox(width:380,child: JobTextForm(jobText: 'Select Date Range',)),
                SizedBox(width:380,child: JobsDropdown(jobHint: 'Customer')),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Divider(
          //     thickness: 0.5,
          //     indent: 12,
          //     endIndent: 12,
          //     color: CustomColors.borderColor),
          JobGridview(),
        ],
      ),
    );
  }
}
