import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_custom_widgets/colors.dart';
import '../common_custom_widgets/custom_heading_text.dart';

class BodyContainer extends StatefulWidget {
  const BodyContainer({super.key});

  @override
  State<BodyContainer> createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: CustomColors.borderColor,
          width:0.5,
        ),
      ),
      height: 350,
      width: 1250,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: HeadingText(
                heading: 'Create Inspection',
                colorName: CustomColors.blackColor,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(

                    decoration: BoxDecoration(
                      color: CustomColors.whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: CustomColors.borderColor,
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.borderColor.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 250,
                    width: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: HeadingText(heading: 'Customer details',
                                colorName: CustomColors.blackColor,
                                fontSize: 18),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                             Icon(Icons.account_box,color: CustomColors.borderColor,size: 26,),
                              const SizedBox(width: 10),
                              HeadingText(heading: 'Customer',
                                  colorName: CustomColors.borderColor,
                                  fontSize: 16),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(Icons.email_outlined,color: CustomColors.borderColor,size: 26,),
                              const SizedBox(width: 10),
                              HeadingText(heading: 'Email',
                                  colorName: CustomColors.borderColor,
                                  fontSize: 16),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(Icons.phone_android,color: CustomColors.borderColor,size: 26,),
                              const SizedBox(width: 10),
                              HeadingText(heading: 'Phone',
                                  colorName: CustomColors.borderColor,
                                  fontSize: 16),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColors.whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: CustomColors.borderColor,
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.borderColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 250,
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: HeadingText(heading: 'Customer Command',
                              colorName: CustomColors.blackColor,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
