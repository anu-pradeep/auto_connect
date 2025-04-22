import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class ServiceAddingButton extends StatefulWidget {
  final VoidCallback addingButton;
  const ServiceAddingButton({super.key, required this.addingButton});

  @override
  State<ServiceAddingButton> createState() => _ServiceAddingButtonState();
}

class _ServiceAddingButtonState extends State<ServiceAddingButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: widget.addingButton, icon: Icon(Icons.add,size: 20,color: CustomColors.redColor,),);
  }
}
