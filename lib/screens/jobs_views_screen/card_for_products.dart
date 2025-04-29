import 'package:flutter/material.dart';

import '../common_custom_widgets/colors.dart';

class CardForProducts extends StatefulWidget {
  const CardForProducts({super.key});

  @override
  State<CardForProducts> createState() => _CardForProductsState();
}

class _CardForProductsState extends State<CardForProducts> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
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
              'Products',
              style: TextStyle(
                  color: CustomColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsMedium'),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total 10.0 AED',
                  style: TextStyle(
                      color: CustomColors.greyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PoppinsRegular'),
                ),
                ElevatedButton(onPressed: (){},  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(08),
                    ),
                    backgroundColor: CustomColors.redColor,
                    fixedSize: const Size(140,50)),
                    child: Text('Add product',style: TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PoppinsRegular'),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
