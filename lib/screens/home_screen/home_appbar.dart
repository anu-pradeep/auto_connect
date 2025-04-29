import 'package:flutter/material.dart';

import '../common_custom_widgets/colors.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget{
  const HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.blackColor,
      actions: [
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
  }
}
