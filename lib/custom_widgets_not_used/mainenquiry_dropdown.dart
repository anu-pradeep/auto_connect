import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/common_custom_widgets/colors.dart';

class EnquiryDropdown extends StatefulWidget {
  final String dropHint;
  const EnquiryDropdown({super.key, required this.dropHint});

  @override
  State<EnquiryDropdown> createState() => _EnquiryDropdownState();
}

class _EnquiryDropdownState extends State<EnquiryDropdown> {
  final List<String> items = ['option 1', 'option 2', 'option 3'];
  String? selectItem;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: CustomColors.greyColor, width: 0.5),
          ), enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(08.0),
          borderSide: BorderSide(color: CustomColors.greyColor, width: 0.5),
        ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide(color: CustomColors.greyColor, width: 0.5),
          ),
        ),
        hint: Text(widget.dropHint, style: TextStyle(
            color: CustomColors.borderColor,
            fontSize: 13.sp,
            fontFamily: 'PoppinsMedium'),),
        value: selectItem,
        items: [], onChanged: (String? value) {});

  }
}
