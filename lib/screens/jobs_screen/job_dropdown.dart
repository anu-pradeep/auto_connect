import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_custom_widgets/colors.dart';
import '../notifier/global_notifier.dart';

class JobsDropdown extends StatefulWidget {
  final String jobHint;
  const JobsDropdown({super.key, required this.jobHint});

  @override
  State<JobsDropdown> createState() => _JobsDropdownState();
}

class _JobsDropdownState extends State<JobsDropdown> {
  String? selectItem;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: CustomColors.greyColor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(08.0),
            borderSide: BorderSide(color: CustomColors.greyColor, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide(color: CustomColors.greyColor, width: 0.5),
          ),
        ),
        hint: Text(
          widget.jobHint,
          style: TextStyle(
              color: CustomColors.borderColor,
              fontSize: 13.sp,
              fontFamily: 'PoppinsMedium'),
        ),
        value: selectItem,
        items: [],
        onChanged: (String? value) {});
        // onChanged: (String? value) {
        //   if(value != null)
        //     {
        //       selectedDropdownValue.value = value;
        //     }
        // });
  }
}
