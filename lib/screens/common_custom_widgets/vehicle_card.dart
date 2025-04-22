import 'package:flutter/material.dart';

import 'colors.dart';

class VehicleCard extends StatefulWidget {
  final String prefixText;
  final String plateSourceText;
  final String plateCategoryText;
  final String plateNo;
  const VehicleCard(
      {super.key,
      required this.prefixText,
      required this.plateSourceText,
      required this.plateCategoryText,
      required this.plateNo});

  @override
  State<VehicleCard> createState() => _VehicleCardState();
}

class _VehicleCardState extends State<VehicleCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const SizedBox(width: 16),

        Container(
          width: 250,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: CustomColors.borderColor,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: CustomColors.redColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.prefixText,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.whiteColor,
                      fontFamily: 'PoppinsMedium'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 10, right: 10, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      widget.plateSourceText,
                      style: TextStyle(
                          fontSize: 12,
                          color: CustomColors.blackColor,
                          fontFamily: 'PoppinsMedium'),
                    ),
                    Text(
                      widget.plateCategoryText,
                      style: TextStyle(
                          fontSize: 9,
                          color: CustomColors.blackColor,
                          fontFamily: 'PoppinsMedium'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Text(
                widget.plateNo,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.blackColor,
                    fontFamily: 'PoppinsMedium'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
