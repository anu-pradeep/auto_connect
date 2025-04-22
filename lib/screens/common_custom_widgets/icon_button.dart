import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final VoidCallback addButton;
  const CustomIconButton({super.key, required this.addButton});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: widget.addButton, icon: Icon(Icons.add,size: 18,color: CustomColors.redColor,),);
  }
}
