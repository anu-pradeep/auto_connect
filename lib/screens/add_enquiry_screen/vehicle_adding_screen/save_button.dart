import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_custom_widgets/colors.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onClick;

  const SaveButton({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.redColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),fixedSize: const Size(130, 55)
      ),
      onPressed: onClick,
      child: Text(
        "Save",
        style: TextStyle(
          color: CustomColors.whiteColor,
          fontFamily: 'PoppinsMedium',
          fontSize: 09.sp,
        ),
      ),
    );
  }

}
