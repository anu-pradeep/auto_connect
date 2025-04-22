import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/common_custom_widgets/colors.dart';

class CustomCancelButton extends StatefulWidget {
  final VoidCallback onClick;

  const CustomCancelButton({super.key, required this.onClick,});

  @override
  State<CustomCancelButton> createState() => _CustomCancelButtonState();
}

class _CustomCancelButtonState extends State<CustomCancelButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.onClick,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(08),
            ),
            backgroundColor: CustomColors.whiteColor,
            fixedSize: const Size(130, 55)),
        child: Text('Cancel',
          style: TextStyle(
              color:CustomColors.blackColor,
              fontFamily: 'PoppinsMedium',
              fontSize: 09.sp),
        ));
  }
}
