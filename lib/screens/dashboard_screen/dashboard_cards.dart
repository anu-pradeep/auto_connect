
import 'package:flutter/material.dart';

class DashboardCards extends StatefulWidget {
  final Color cardColor;
  final Color textColor;
  final Color iconColor;
  final IconData icons;
  final String cardText1;
  final String cardText2;

  final double fontSize;
  final double iconSize;
  final VoidCallback onTap;

  const DashboardCards({
    super.key,
    required this.cardColor,
    required this.icons,
    required this.textColor,
    required this.fontSize,
    required this.iconSize,
    required this.cardText1,
    required this.cardText2,
    required this.iconColor,
    required this.onTap,
  });

  @override
  State<DashboardCards> createState() => _DashboardCardsState();
}

class _DashboardCardsState extends State<DashboardCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: widget.cardColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.icons,
                size: widget.iconSize,
                color: widget.iconColor,
              ),
              Text(
                widget.cardText1,
                style: TextStyle(
                    color: widget.textColor,
                    fontSize: widget.fontSize,
                    fontFamily: 'PoppinsMedium'),
              ),
              Text(
                widget.cardText2,
                style: TextStyle(
                    color: widget.textColor,
                    fontSize: widget.fontSize,
                    fontFamily: 'PoppinsMedium'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
