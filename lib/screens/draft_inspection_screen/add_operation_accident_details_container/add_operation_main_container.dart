import 'package:flutter/cupertino.dart';

import '../../common_custom_widgets/colors.dart';
import '../../common_custom_widgets/custom_heading_text.dart';

class AddOperationMainContainer extends StatefulWidget {
  const AddOperationMainContainer({super.key});

  @override
  State<AddOperationMainContainer> createState() => _AddOperationMainContainerState();
}

class _AddOperationMainContainerState extends State<AddOperationMainContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      color: CustomColors.whiteColor,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: CustomColors.borderColor,
        width:0.5,
      ),
    ),
      height: 350,
      width: 1250,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText(
            heading: 'Add Operation Accident details',
            colorName: CustomColors.blackColor,
            fontSize: 19,
          ),
        ],
      ),
    ),);
  }
}
