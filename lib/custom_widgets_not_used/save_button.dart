import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/common_custom_widgets/colors.dart';

class CustomerSaveButton extends StatefulWidget {
  final VoidCallback onClick;

  const CustomerSaveButton({super.key, required this.onClick,});

  @override
  State<CustomerSaveButton> createState() => _CustomerSaveButtonState();
}

class _CustomerSaveButtonState extends State<CustomerSaveButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.onClick,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(08),
            ),
            backgroundColor: CustomColors.redColor,
            fixedSize: const Size(130, 55)),
        child: Text('Save',
          style: TextStyle(
              color:CustomColors.whiteColor,
              fontFamily: 'PoppinsMedium',
              fontSize: 09.sp),
        ));
  }
}
