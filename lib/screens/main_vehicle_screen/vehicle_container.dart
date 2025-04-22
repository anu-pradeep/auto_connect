import 'package:auto_connect/screens/main_vehicle_screen/vehicle_grid_view.dart';
import 'package:auto_connect/screens/main_vehicle_screen/vehicle_text_form.dart';
import 'package:flutter/widgets.dart';

import '../add_enquiry_screen/customer_dropdown_field.dart';
import '../add_enquiry_screen/vehicle_adding_screen/brands_dropdown.dart';
import '../add_enquiry_screen/vehicle_adding_screen/car_model_dropdown.dart';
import '../add_enquiry_screen/vehicle_list_dropdown.dart';
import '../common_custom_widgets/colors.dart';

class VehicleContainer extends StatefulWidget {
  const VehicleContainer({super.key});

  @override
  State<VehicleContainer> createState() => _VehicleContainerState();
}

class _VehicleContainerState extends State<VehicleContainer> {
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
                      width: 200,
                      child: VehicleTextFrom(
                        formText: 'Keyword',
                      )),
                  const SizedBox(
                      width: 200,
                      child: VehicleTextFrom(
                        formText: 'Select Date Range',
                      )),
                  SizedBox(
                      width: 200,
                      child: SearchableCustomerDropdown(
                        hintText: 'Customer',
                        onItemSelected: (String) {},
                      )),
                  SizedBox(
                      width: 200,
                      child: SearchableCarCompanyDropdown(
                        hintText: 'Brand',
                        onItemSelected: (String) {},
                        validator: (String) {},
                      )),
                  SizedBox(width: 200,
                    child: CarModelsDropdown(
                      hintText: 'Model',
                      onItemSelected: (String) {},
                    ),
                  )
                ],
              ),
            ),
            const VehicleGridview()
          ],
        ),
      ),
    );
  }
}
