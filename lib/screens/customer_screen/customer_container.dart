import 'package:flutter/material.dart';

import '../common_custom_widgets/colors.dart';
import '../common_custom_widgets/date_selection_dropdown.dart';
import 'active_or_inactive_dropdown.dart';
import 'customer_grid_view.dart';
import 'customer_text_form.dart';
import 'customer_type_dropdown.dart';

class CustomerContainer extends StatefulWidget {
  const CustomerContainer({super.key});

  @override
  State<CustomerContainer> createState() => _CustomerContainerState();
}

class _CustomerContainerState extends State<CustomerContainer> {
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
                  const SizedBox(
                      width: 270,
                      child: CustomerTextFrom(
                        formText: 'Keyword',
                      )),
                  SizedBox(
                    width: 270,
                    child: SelectDateRangeDropdown(
                      onDateRangeSelected:
                          (DateTime? startDate, DateTime? endDate) {
                      },
                    ),
                  ),
                  SizedBox(
                      width: 250,
                      child: ActiveOrInactiveDropdown(
                        hintText: 'Select Status',
                        onItemSelected: (String) {},
                      )),
                  SizedBox(
                      width: 270,
                      child: TypeOfCustomerDropdown(
                        hintText: 'Customer Type',
                        onItemSelected: (String) {},
                      )),

                ],
              ),
            ),
            const SizedBox(height: 10,),
            const CustomerGridView()
          ],
        ),
      ),
    );
  }
}
