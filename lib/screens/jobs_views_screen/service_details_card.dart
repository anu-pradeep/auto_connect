import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({super.key});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
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
            Text(
              'Service details',
              style: TextStyle(
                  color: CustomColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                fontFamily: 'PoppinsRegular',
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Job card Date ',
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
                  Icons.calendar_today,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Started Date',
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
                  Icons.account_box,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Created by',
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
                  Icons.mark_chat_read_rounded,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Verified by',
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
                  Icons.calendar_month,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Verified Date',
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
                  Icons.pie_chart,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Status',
                  style: TextStyle(
                      color: CustomColors.borderColor,
                      fontSize: 13,
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
