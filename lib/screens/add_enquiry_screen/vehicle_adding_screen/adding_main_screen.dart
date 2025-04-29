import 'package:auto_connect/screens/add_enquiry_screen/vehicle_adding_screen/plate_category_dropdown.dart';
import 'package:auto_connect/screens/add_enquiry_screen/vehicle_adding_screen/plate_no_textfield.dart';
import 'package:auto_connect/screens/add_enquiry_screen/vehicle_adding_screen/plate_prefix_textfield.dart';
import 'package:auto_connect/screens/add_enquiry_screen/vehicle_adding_screen/plate_source_dropdown.dart';
import 'package:auto_connect/screens/add_enquiry_screen/vehicle_adding_screen/save_button.dart';
import 'package:auto_connect/screens/common_custom_widgets/text_span_text.dart';
import 'package:auto_connect/screens/add_enquiry_screen/vehicle_adding_screen/years_dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../api_service_classes/new_vehicle_save.dart';
import '../../common_custom_widgets/colors.dart';
import '../../common_custom_widgets/custom_heading_text.dart';
import '../../main_vehicle_screen/main_vehicle_screen.dart';
import '../customer_dropdown_field.dart';
import 'cancel_button.dart';
import 'brands_dropdown.dart';
import 'car_model_dropdown.dart';
import 'chassis_no_textfield.dart';
import 'color_textfield.dart';
import 'engine_no_textfield.dart';
import 'image_picker.dart';
import 'origin_textfield.dart';

class MainScreenOfVehicleAdding extends StatefulWidget {
  const MainScreenOfVehicleAdding({super.key});

  @override
  State<MainScreenOfVehicleAdding> createState() =>
      _MainScreenOfVehicleAddingState();
}

class _MainScreenOfVehicleAddingState extends State<MainScreenOfVehicleAdding> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController plateNoController = TextEditingController();
  final TextEditingController platePrefixController = TextEditingController();
  final TextEditingController chassisNoController = TextEditingController();
  final TextEditingController engineNoController = TextEditingController();
  final TextEditingController originController = TextEditingController();
  final TextEditingController colourController = TextEditingController();
  String? selectedPlateSource;
  String? selectPlateNo;
  String? selectedPlateCategory;
  String? selectedYear;
  String? selectedCarCompany;
  String? selectedCustomerId;
  String? selectedCarModels;
  String? selectedCarYear;
  List<Map<String, dynamic>> brands = [];
  List<Map<String, dynamic>> models = [];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      contentPadding: const EdgeInsets.all(20),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 950,
          height: 1000,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeadingText(
                heading: 'Add Vehicle',
                colorName: CustomColors.blackColor,
                fontSize: 15.sp,
              ),
              const SizedBox(height: 15),
              Row(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomRichText(
                        mainText: 'Plate number',
                        highlightedText: '*',
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: PlateNoTextField(
                          controller: plateNoController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Plate number is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomRichText(
                        mainText: 'Plate source',
                        highlightedText: '*',
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: PlateSourceDropdown(
                          hintText: 'Select an emirate',
                          onItemSelected: (String item) {
                            setState(() {
                              selectedPlateSource = item;
                            });
                          },
                          validator: (value) {
                            if (selectedPlateSource == null ||
                                selectedPlateSource!.isEmpty) {
                              return 'required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomRichText(
                        mainText: 'Plate category',
                        highlightedText: '*',
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: PlateCategoryDropdown(
                          hintText: 'Select Plate Category',
                          onItemSelected: (String item) {
                            setState(() {
                              selectedPlateCategory = item;
                            });
                          },
                          validator: (value) {
                            if (selectedPlateCategory == null ||
                                selectedPlateCategory!.isEmpty) {
                              return 'required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        heading: 'Plate prefix',
                        colorName: CustomColors.blackColor,
                        fontSize: 12,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: PlatePrefixTextField(
                            controller: platePrefixController),
                      ),
                    ],
                  ),
                ],
              ), // 1st row end
              const SizedBox(height: 10),
              Row(
                // 2nd row start
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        heading: 'Customer',
                        colorName: CustomColors.blackColor,
                        fontSize: 12,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: SearchableCustomerDropdown(
                          hintText: 'Select a Customer',
                          onItemSelected: (String customerId) {
                            setState(() {
                              selectedCustomerId = customerId;
                            });
                          },
                          validator: (value) {
                            if (selectedCustomerId == null ||
                                selectedCustomerId!.isEmpty) {
                              return 'Please select a customer';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomRichText(
                        mainText: 'Brands',
                        highlightedText: '*',
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: SearchableCarCompanyDropdown(
                          hintText: 'Select Car Brand',
                          onItemSelected: (String item) {
                            setState(() {
                              selectedCarCompany = item;
                            });
                          },
                          validator: (value) {
                            if (selectedCarCompany == null ||
                                selectedCarCompany!.isEmpty) {
                              return 'required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        heading: 'Models',
                        colorName: CustomColors.blackColor,
                        fontSize: 12,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: CarModelsDropdown(
                          hintText: 'Select a model',
                          // brandId: selectedCarCompany,
                          onItemSelected: (String carModelId) {
                           setState(() {
                             selectedCarModels =carModelId;
                           });
                          },

                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomRichText(
                        mainText: 'Select a year',
                        highlightedText: '*',
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: SearchableYearDropdown(
                          hintText: 'Select Car Year',
                          onItemSelected: (String item) {
                            setState(() {
                              selectedCarYear = item;
                            });
                          },
                          validator: (value) {
                            if (selectedCarYear == null ||
                                selectedCarYear!.isEmpty) {
                              return 'required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ), //2nd row end
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        heading: 'Chassis Number',
                        colorName: CustomColors.blackColor,
                        fontSize: 12,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: 200,
                          child: ChassisNoTextField(
                              controller: chassisNoController)),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        heading: 'Engine Number',
                        colorName: CustomColors.blackColor,
                        fontSize: 12,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: 200,
                          child:
                              EnginNOTextField(controller: engineNoController)),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        heading: 'Origin',
                        colorName: CustomColors.blackColor,
                        fontSize: 12,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: 200,
                          child: OriginTextField(controller: originController)),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        heading: 'Colour',
                        colorName: CustomColors.blackColor,
                        fontSize: 12,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: 200,
                          child: ColourTextField(controller: colourController)),
                    ],
                  ),
                ],
              ),

              const VehicleImagePicker(),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CancelButton(
                    onClick: () {

                      plateNoController.clear();
                      platePrefixController.clear();
                      chassisNoController.clear();
                      engineNoController.clear();
                      originController.clear();
                      colourController.clear();

                      setState(() {
                        selectedYear = null;
                        selectedCarCompany = null;
                        selectedCustomerId = null;
                      });

                      //  go back
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 10),
                  SaveButton(onClick:saveVehicle),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void saveVehicle() async {

    if (_formKey.currentState!.validate()) {
      try {

        int stateId = int.parse(selectedPlateSource ?? '0');
        int brandId = int.parse(selectedCarCompany ?? '0');
        int modelId = int.parse(selectedCarModels ?? '0');
        int registerYear = int.parse(selectedCarYear ?? '0');


        final vehicleSaveService = VehicleSaveService();


        final result = await vehicleSaveService.saveVehicle(
          stateId: stateId,
          plateType: selectedPlateCategory ?? '',
          registerNumber: plateNoController.text,
          registerYear: registerYear,
          brandId: brandId,
          modelId:modelId ,
          platePrefix: platePrefixController.text.isNotEmpty ? platePrefixController.text : null,
          customerId: selectedCustomerId != null ? int.parse(selectedCustomerId!) : null,
          chassisNumber: chassisNoController.text.isNotEmpty ? chassisNoController.text : null,
          engineNumber: engineNoController.text.isNotEmpty ? engineNoController.text : null,
          colour: colourController.text.isNotEmpty ? colourController.text : null,
          // image: null,
        );


        if (result['status']) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result['message'] ?? 'Vehicle saved successfully',style:  TextStyle(fontFamily: 'PoppinsRegular',  color: CustomColors.blackColor,),),
              backgroundColor: CustomColors.greenColor,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const MainVehicleScreen()),
          );


        } else {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result['message'] ?? 'Failed to save vehicle',style:  TextStyle(fontFamily: 'PoppinsRegular' , color: CustomColors.blackColor,),),
              backgroundColor:CustomColors.redColor,
            ),
          );

        }
      } catch (e) {
        if (kDebugMode) {
          print('Error saving vehicle: $e');
        }
        // ScaffoldMessenger.of(context).showSnackBar(
        //    SnackBar(
        //     content: const Text('An error occurred while saving the vehicle',style: TextStyle(fontFamily: 'PoppinsRegular'),),
        //     backgroundColor: CustomColors.redColor,
        //   ),
        // );
      }

    }
  }
}
