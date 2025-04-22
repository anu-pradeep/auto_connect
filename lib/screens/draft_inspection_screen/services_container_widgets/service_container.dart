import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:auto_connect/screens/draft_inspection_screen/services_container_widgets/service_adding_button.dart';
import 'package:auto_connect/screens/draft_inspection_screen/services_container_widgets/service_category_dropdown.dart';
import 'package:auto_connect/screens/draft_inspection_screen/services_container_widgets/service_tax_dropdown.dart';
import 'package:auto_connect/screens/draft_inspection_screen/services_container_widgets/service_textformfield.dart';
import 'package:auto_connect/screens/draft_inspection_screen/services_container_widgets/services_dropdown.dart';
import 'package:flutter/cupertino.dart';

import '../../common_custom_widgets/colors.dart';
import '../../common_custom_widgets/icon_button.dart';

class ServiceContainer extends StatefulWidget {
  const ServiceContainer({super.key});

  @override
  State<ServiceContainer> createState() => _ServiceContainerState();
}

class _ServiceContainerState extends State<ServiceContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: CustomColors.borderColor,
          width: 0.5,
        ),
      ),
      height: 200,
      width: 1250,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingText(
                heading: 'Services',
                colorName: CustomColors.blackColor,
                fontSize: 18),
            const SizedBox(height: 15),
            Row(
              children: [
                HeadingText(
                    heading: 'Service Category ',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),
                HeadingText(
                    heading: ' * ',
                    colorName: CustomColors.redColor,
                    fontSize: 16),
                CustomIconButton(
                  addButton: () {},
                ),
                // const SizedBox(width: 05),
                HeadingText(
                    heading: 'Service ',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),
                HeadingText(
                    heading: ' * ',
                    colorName: CustomColors.redColor,
                    fontSize: 16),
                CustomIconButton(
                  addButton: () {},
                ),
                const SizedBox(width: 80),
                HeadingText(
                    heading: 'Quantity ',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),

                const SizedBox(width: 25),
                HeadingText(
                    heading: 'Price ',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),
                const SizedBox(width: 65),
                HeadingText(
                    heading: 'Item Total ',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),
                const SizedBox(width: 50),
                HeadingText(
                    heading: 'Tax %',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),
                const SizedBox(width: 63),
                HeadingText(
                    heading: 'Tax Amount ',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),
                const SizedBox(width: 10),
                HeadingText(
                    heading: 'Total ',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                    width: 190,
                    child: ServiceCategoryDropdown(
                      hintText: 'Category',
                      onItemSelected: (String) {},
                    )),
                const SizedBox(width: 20),
                SizedBox(
                    width: 190,
                    child: ServicesDropdown(
                      hintText: 'Service',
                      onItemSelected: (String) {},
                    )),
                const SizedBox(width: 20),
                SizedBox(
                    width: 80,
                    child: ServiceTextForm(
                      formText: 'Qty',
                      controller: quantityController,
                    )),
                const SizedBox(width: 20),
                SizedBox(
                    width: 90,
                    child: ServiceTextForm(
                      formText: 'Price',
                      controller: priceController,
                    )),
                const SizedBox(width: 20),
                SizedBox(
                    width: 120,
                    child: ServiceTextForm(
                      formText: 'Item total',
                      controller: itemTotalController,
                    )),
                const SizedBox(width: 20),
                SizedBox(
                    width: 90,
                    child: ServiceTaxDropdown(
                      hintText: 'Tax',
                      onItemSelected: (String) {},
                    )),
                const SizedBox(width: 20),
                SizedBox(
                    width: 90,
                    child: ServiceTextForm(
                      formText: 'Tax',
                      controller: itemTotalController,
                    )),
                const SizedBox(width: 25),
                SizedBox(
                    width: 150,
                    child: ServiceTextForm(
                      formText: 'Tax',
                      controller: itemTotalController,
                    )),
                const SizedBox(width: 10),
                ServiceAddingButton(
                  addingButton: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController itemTotalController = TextEditingController();
}
