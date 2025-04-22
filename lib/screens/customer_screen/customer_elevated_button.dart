import 'package:flutter/material.dart';

class CustomerElevatedButton extends StatefulWidget {
  final VoidCallback onClick;
  final Color butColor;
  final Color texColor;
  final String elevText;
  const CustomerElevatedButton({super.key, required this.onClick, required this.butColor, required this.texColor, required this.elevText});

  @override
  State<CustomerElevatedButton> createState() => _CustomerElevatedButtonState();
}

class _CustomerElevatedButtonState extends State<CustomerElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.onClick,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(08),
            ),
            backgroundColor: widget.butColor,
            fixedSize: const Size(130, 55)),
        child: Text(widget.elevText,
          style: TextStyle(
              color: widget.texColor,
              fontFamily: 'PoppinsMedium',
              fontSize: 12),
        ));
  }
}
