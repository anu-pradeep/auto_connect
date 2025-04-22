import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatefulWidget {
  const CustomerCard({super.key});

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 04,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: CustomColors.greyColor, width: 0.5)),
      color: CustomColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer details',
              style: TextStyle(
                  color: CustomColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsMedium'),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Customer',
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
                  Icons.email_outlined,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Email',
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
                  Icons.phone_android,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Phone',
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
                  Icons.discount,
                  color: CustomColors.greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  'Customer command',
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
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 05),
              child: Text(
                ' LPO number',
                style: TextStyle(
                    color: CustomColors.borderColor,
                    fontSize: 13,
                    fontFamily: 'PoppinsRegular'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
