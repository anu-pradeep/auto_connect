import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';
import '../add_enquiry_screen/customer_dropdown_field.dart';
import '../common_custom_widgets/date_selection_dropdown.dart';
import 'job_gridview.dart';
import 'job_textform.dart';

class JobScreenContainer extends StatefulWidget {
  const JobScreenContainer({super.key});

  @override
  State<JobScreenContainer> createState() => _JobScreenContainerState();
}

class _JobScreenContainerState extends State<JobScreenContainer> {
  final TextEditingController jobKeywordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 550,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 380,
                    child: JobTextForm(
                      jobText: 'Keyword',
                      controller: jobKeywordController,
                    )),
                SizedBox(
                  width: 380,
                  child: SelectDateRangeDropdown(
                    onDateRangeSelected:
                        (DateTime? startDate, DateTime? endDate) {},
                  ),
                ),
                 SizedBox(
                    width: 380, child: SearchableCustomerDropdown(
                  hintText: 'Customer',
                  onItemSelected: (String) {},
                )),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const JobGridview(),
        ],
      ),
    );
  }
}
