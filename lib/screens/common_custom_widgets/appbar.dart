import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_connect/screens/jobs_screen/job_dropdown.dart';

import '../notifier/global_notifier.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder<String>(
    //     valueListenable: selectedDropdownValue,
    //     builder: (context, selectedValue, child) {
    return AppBar(

      backgroundColor: CustomColors.blackColor,
      leading: IconButton(
        icon: Icon(Icons.menu, color: CustomColors.borderColor),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        // Text(selectedValue,style: TextStyle(color: CustomColors.whiteColor),),
        IconButton(
          icon: Icon(Icons.search, color: CustomColors.borderColor),
          onPressed: () {},
        ),

        IconButton(
          icon: Icon(Icons.grid_view, color: CustomColors.borderColor),
          onPressed: () {},
        ),

      ],
    );
  // });
}
}
