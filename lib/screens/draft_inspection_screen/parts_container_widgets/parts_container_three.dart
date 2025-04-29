// import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
// import 'package:auto_connect/screens/draft_inspection_screen/parts_container_widgets/parts_adding_button.dart';
// import 'package:auto_connect/screens/draft_inspection_screen/parts_container_widgets/parts_number_dropdown.dart';
// import 'package:auto_connect/screens/draft_inspection_screen/parts_container_widgets/parts_service_dropdown.dart';
// import 'package:auto_connect/screens/draft_inspection_screen/parts_container_widgets/parts_textformfield.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../../common_custom_widgets/colors.dart';
// import '../../common_custom_widgets/icon_button.dart';
//
// class PartsContainer extends StatefulWidget {
//   const PartsContainer({super.key});
//
//   @override
//   State<PartsContainer> createState() => _PartsContainerState();
// }
//
// class _PartsContainerState extends State<PartsContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: CustomColors.whiteColor,
//         borderRadius: BorderRadius.circular(10.0),
//         border: Border.all(
//           color: CustomColors.borderColor,
//           width: 0.5,
//         ),
//       ),
//       height: 200,
//       width: 1250,
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HeadingText(
//                 heading: 'Parts and Consumable',
//                 colorName: CustomColors.blackColor,
//                 fontSize: 18),
//             const SizedBox(height: 15),
//             Row(
//               children: [
//                 HeadingText(
//                     heading: 'Parts Number ',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 16),
//                 HeadingText(
//                     heading: ' * ',
//                     colorName: CustomColors.redColor,
//                     fontSize: 16),
//                 CustomIconButton(
//                   addButton: () {},
//                 ),
//                 const SizedBox(width: 85),
//                 HeadingText(
//                     heading: 'Quantity ',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 16),
//                 const SizedBox(width: 25),
//                 HeadingText(
//                     heading: 'Price ',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 16),
//                 const SizedBox(width: 65),
//                 HeadingText(
//                     heading: 'Item Total ',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 16),
//                 const SizedBox(width: 50),
//                 HeadingText(
//                     heading: 'Tax %',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 16),
//                 const SizedBox(width: 63),
//                 HeadingText(
//                     heading: 'Tax Amount ',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 16),
//                 const SizedBox(width: 20),
//                 HeadingText(
//                     heading: 'Total ',
//                     colorName: CustomColors.blackColor,
//                     fontSize: 16),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 SizedBox(
//                     width: 250,
//                     child: PartsServiceNoDropdown(
//                       hintText: 'Parts Number',
//                       onItemSelected: (String) {},
//                     )),
//                 const SizedBox(width: 20),
//                 SizedBox(
//                     width: 80,
//                     child: PartsTextForm(
//                       formText: 'Qty',
//                       controller: partsQuantityController,
//                     )),
//                 const SizedBox(width: 20),
//                 SizedBox(
//                     width: 90,
//                     child: PartsTextForm(
//                       formText: 'Price',
//                       controller: partsPriceController,
//                     )),
//                 const SizedBox(width: 20),
//                 SizedBox(
//                     width: 120,
//                     child: PartsTextForm(
//                       formText: 'Item total',
//                       controller: partsItemTotalController,
//                     )),
//                 const SizedBox(width: 20),
//                 SizedBox(
//                     width: 90,
//                     child: PartsTaxDropdown(
//                       hintText: 'Tax',
//                       onItemSelected: (String) {},
//                     )),
//                 const SizedBox(width: 20),
//                 SizedBox(
//                     width: 90,
//                     child: PartsTextForm(
//                       formText: 'Tax',
//                       controller: partsItemTotalController,
//                     )),
//                 const SizedBox(width: 35),
//                 SizedBox(
//                     width: 150,
//                     child: PartsTextForm(
//                       formText: 'Tax',
//                       controller: partsItemTotalController,
//                     )),
//                 const SizedBox(width: 20),
//                 PartsAddingButton(
//                   addingButton: () {},
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   final TextEditingController partsQuantityController = TextEditingController();
//   final TextEditingController partsPriceController = TextEditingController();
//   final TextEditingController partsItemTotalController =
//   TextEditingController();
// }
import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:auto_connect/screens/draft_inspection_screen/parts_container_widgets/parts_adding_button.dart';
import 'package:auto_connect/screens/draft_inspection_screen/parts_container_widgets/parts_number_dropdown.dart';
import 'package:auto_connect/screens/draft_inspection_screen/parts_container_widgets/parts_service_dropdown.dart';
import 'package:auto_connect/screens/draft_inspection_screen/parts_container_widgets/parts_textformfield.dart';
import 'package:flutter/material.dart';

import '../../common_custom_widgets/colors.dart';
import '../../common_custom_widgets/icon_button.dart';

class PartsContainer extends StatefulWidget {
  const PartsContainer({super.key});

  @override
  State<PartsContainer> createState() => _PartsContainerState();
}

class _PartsContainerState extends State<PartsContainer> {

  List<PartsRowData> partsRows = [];

  @override
  void initState() {
    super.initState();

    _addNewRow();
  }

  void _addNewRow() {
    setState(() {
      partsRows.add(PartsRowData(
        quantityController: TextEditingController(),
        priceController: TextEditingController(),
        itemTotalController: TextEditingController(),
        taxAmountController: TextEditingController(),
        totalController: TextEditingController(),
      ));
    });
  }

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

      height: 220 + (partsRows.length > 1 ? (partsRows.length - 1) * 60 : 0),
      width: 1250,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingText(
                heading: 'Parts and Consumable',
                colorName: CustomColors.blackColor,
                fontSize: 18),
            const SizedBox(height: 15),
            // Headers row
            Row(
              children: [
                HeadingText(
                    heading: 'Parts Number ',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),
                HeadingText(
                    heading: ' * ',
                    colorName: CustomColors.redColor,
                    fontSize: 16),
                CustomIconButton(
                  addButton: () {},
                ),
                const SizedBox(width: 85),
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
                const SizedBox(width: 20),
                HeadingText(
                    heading: 'Total ',
                    colorName: CustomColors.blackColor,
                    fontSize: 16),
              ],
            ),
            const SizedBox(height: 10),

            ...partsRows.map((rowData) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: buildPartsRow(rowData, partsRows.indexOf(rowData) == partsRows.length - 1),
            )),
          ],
        ),
      ),
    );
  }

  Widget buildPartsRow(PartsRowData rowData, bool isLastRow) {
    return Row(
      children: [
        SizedBox(
            width: 250,
            child: PartsServiceNoDropdown(
              hintText: 'Select Product',
              onItemSelected: (String) {},
            )),
        const SizedBox(width: 20),
        SizedBox(
            width: 80,
            child: PartsTextForm(
              formText: 'Qty',
              controller: rowData.quantityController,
            )),
        const SizedBox(width: 20),
        SizedBox(
            width: 90,
            child: PartsTextForm(
              formText: 'Price',
              controller: rowData.priceController,
            )),
        const SizedBox(width: 20),
        SizedBox(
            width: 120,
            child: PartsTextForm(
              formText: 'Total',
              controller: rowData.itemTotalController,
            )),
        const SizedBox(width: 20),
        SizedBox(
            width: 90,
            child: PartsTaxDropdown(
              hintText: '5%',
              onItemSelected: (String) {},
            )),
        const SizedBox(width: 20),
        SizedBox(
            width: 90,
            child: PartsTextForm(
              formText: 'Tax',
              controller: rowData.taxAmountController,
            )),
        const SizedBox(width: 35),
        SizedBox(
            width: 150,
            child: PartsTextForm(
              formText: 'Total',
              controller: rowData.totalController,
            )),
        const SizedBox(width: 20),
        // Only show the add button on the last row
        isLastRow
            ? PartsAddingButton(
          addingButton: _addNewRow,
        )
            : SizedBox(
          width: 40,
          child: IconButton(
            icon: Icon(Icons.remove_circle_outline, color: CustomColors.redColor),
            onPressed: () {
              setState(() {
                partsRows.remove(rowData);
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (var row in partsRows) {
      row.quantityController.dispose();
      row.priceController.dispose();
      row.itemTotalController.dispose();
      row.taxAmountController.dispose();
      row.totalController.dispose();
    }
    super.dispose();
  }
}

class PartsRowData {
  final TextEditingController quantityController;
  final TextEditingController priceController;
  final TextEditingController itemTotalController;
  final TextEditingController taxAmountController;
  final TextEditingController totalController;

  PartsRowData({
    required this.quantityController,
    required this.priceController,
    required this.itemTotalController,
    required this.taxAmountController,
    required this.totalController,
  });
}