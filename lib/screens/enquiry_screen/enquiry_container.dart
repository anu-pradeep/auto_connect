import 'package:auto_connect/screens/Enquiry_screen/mainenquiry_textfromfield.dart';
import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../add_enquiry_screen/customer_dropdown_field.dart';
import '../add_enquiry_screen/vehicle_list_dropdown.dart';
import '../common_custom_widgets/date_selection_dropdown.dart';
import 'gridview_builder.dart';
import 'is_converted_dropdown.dart';
import 'is_insured_dropdown.dart';

class MainEnquiryContainer extends StatefulWidget {
  const MainEnquiryContainer({super.key});

  @override
  State<MainEnquiryContainer> createState() => _MainEnquiryContainerState();
}

class _MainEnquiryContainerState extends State<MainEnquiryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 550,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 200,
                      child: MainEnqTextFrom(
                        formText: 'Keyword',
                        controller: keywordController,
                      )),
                  SizedBox(
                    width: 200,
                    child: SelectDateRangeDropdown(
                      onDateRangeSelected:
                          (DateTime? startDate, DateTime? endDate) {
                        if (startDate != null && endDate != null) {
                          print(
                              'Selected range: ${DateFormat('yyyy/MM/dd').format(startDate)} - ${DateFormat('yyyy/MM/dd').format(endDate)}');
                        }
                      },
                    ),
                  ),

                  SizedBox(
                      width: 200,
                      child: SearchableCustomerDropdown(
                        hintText: 'Customer',
                        onItemSelected: (String) {},
                      )),
                  SizedBox(
                      width: 200,
                      child: SearchableVehicleDropdown(
                        hintText1: 'Vehicle',
                        onItemSelected: (String) {},
                        validator: (String) {},
                      )),

                  SizedBox(
                    width: 200,
                    child: IsInsuredDropdown(
                      hintText: 'Is Insured',
                      onItemSelected: (value) {
                        setState(() {
                          insuredOrNot = value;
                        });
                      },
                      items: const ['Yes', 'No'],
                    ),
                  ),
                  SizedBox(
                      width: 200,
                      child: IsConvertedDropdown(
                        hintText: 'Is Converted',
                        onItemSelected: (value) {
                          setState(() {
                            convertedOr = value;
                          });
                        },
                        items: const ['Yes', 'No'],
                      )),
                ],
              ),
            ),
            // const SizedBox(height: 15),

            const SizedBox(height: 20),

            const EnquiryGridview()
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> cardsData = [];
  String? insuredOrNot;
  String? convertedOr;
  final TextEditingController keywordController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();
}
