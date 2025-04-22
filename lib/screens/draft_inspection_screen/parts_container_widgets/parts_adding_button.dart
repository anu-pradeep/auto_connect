import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class PartsAddingButton extends StatefulWidget {
  final VoidCallback addingButton;
  const PartsAddingButton({super.key, required this.addingButton});

  @override
  State<PartsAddingButton> createState() => _PartsAddingButtonState();
}

class _PartsAddingButtonState extends State<PartsAddingButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: widget.addingButton, icon: Icon(Icons.add,size: 20,color: CustomColors.redColor,),);
  }
}
