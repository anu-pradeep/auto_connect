import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';


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

    return AppBar(

      backgroundColor: CustomColors.blackColor,
      leading: IconButton(
        icon: Icon(Icons.menu, color: CustomColors.borderColor),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
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
  // });
}
}
