import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_custom_widgets/colors.dart';

class CancelButton extends StatefulWidget {
  final VoidCallback onClick;

  const CancelButton({super.key, required this.onClick,});

  @override
  State<CancelButton> createState() => _CancelButtonState();
}

class _CancelButtonState extends State<CancelButton> {
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
