import 'package:flutter/material.dart';

import '../common_custom_widgets/colors.dart';
import '../common_custom_widgets/vehicle_card.dart';

class VehicleCards extends StatefulWidget {
  const VehicleCards({super.key});

  @override
  State<VehicleCards> createState() => _VehicleCardsState();
}

class _VehicleCardsState extends State<VehicleCards> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 04,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: CustomColors.greyColor, width: 0.5)),
      color: CustomColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vehicle details',
                  style: TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PoppinsMedium'),
                ),
                const SizedBox(width: 80),
                const VehicleCard(
                  prefixText: 'b ',
                  plateSourceText: 'xxxx',
                  plateCategoryText: 'xxxxxxxxxx',
                  plateNo: '100',
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.branding_watermark,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Brand',
                  style: TextStyle(
                      color: CustomColors.borderColor,
                      fontSize: 13,
                      fontFamily: 'PoppinsRegular'),
                ),
              ],
            ),
            const SizedBox(height: 05),
            Divider(
                thickness: 0.5,
                indent: 13,
                endIndent: 13,
                color: CustomColors.borderColor),
            const SizedBox(height: 05),
            Row(
              children: [
                Icon(
                  Icons.car_repair,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Model',
                  style: TextStyle(
                      color: CustomColors.borderColor,
                      fontSize: 15,
                      fontFamily: 'PoppinsRegular'),
                ),
              ],
            ),
            const SizedBox(height: 05),
            Divider(
                thickness: 0.5,
                indent: 13,
                endIndent: 13,
                color: CustomColors.borderColor),
            const SizedBox(height: 05),
            Row(
              children: [
                Icon(
                  Icons.flight_takeoff_outlined,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Emirate',
                  style: TextStyle(
                      color: CustomColors.borderColor,
                      fontSize: 15,
                      fontFamily: 'PoppinsRegular'),
                ),
              ],
            ),
            const SizedBox(height: 05),
            Divider(
                thickness: 0.5,
                indent: 13,
                endIndent: 13,
                color: CustomColors.borderColor),
            const SizedBox(height: 05),
            Row(
              children: [
                Icon(
                  Icons.car_repair,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Odometer',
                  style: TextStyle(
                      color: CustomColors.borderColor,
                      fontSize: 15,
                      fontFamily: 'PoppinsRegular'),
                ),
              ],
            ),
            const SizedBox(height: 05),
            Divider(
                thickness: 0.5,
                indent: 13,
                endIndent: 13,
                color: CustomColors.borderColor),
            const SizedBox(height: 05),
            Row(
              children: [
                Icon(
                  Icons.discount,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Insured',
                  style: TextStyle(
                      color: CustomColors.borderColor,
                      fontSize: 15,
                      fontFamily: 'PoppinsRegular'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
