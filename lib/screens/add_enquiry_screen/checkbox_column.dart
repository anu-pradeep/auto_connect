import 'package:auto_connect/api_service_classes/enquiry_save_api.dart';
import 'package:auto_connect/screens/add_enquiry_screen/police_report_textformfield.dart';
import 'package:auto_connect/screens/add_enquiry_screen/policy_no_textformfield.dart';
import 'package:auto_connect/screens/add_enquiry_screen/textform_field.dart';
import 'package:auto_connect/screens/add_enquiry_screen/vehicle_adding_screen/adding_main_screen.dart';
import 'package:auto_connect/screens/add_enquiry_screen/vehicle_list_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model_classes/enquiry_model.dart';
import '../common_custom_widgets/colors.dart';
import '../common_custom_widgets/custom_heading_text.dart';
import '../common_custom_widgets/icon_button.dart';
import 'check_box.dart';
import 'command_field.dart';
import 'customer_adding_screen/alert_dialog_box.dart';
import 'customer_dropdown_field.dart';
import 'insurance_dropdown.dart';

class CheckboxColumn extends StatefulWidget {
  const CheckboxColumn({super.key});

  @override
  State<CheckboxColumn> createState() => _CheckboxColumnState();
}

class _CheckboxColumnState extends State<CheckboxColumn> {
  final _formKey = GlobalKey<FormState>();
  bool isInsured = false;
  String? selectedInsuranceId;
  var selectedCustomerId;
  String? selectedVehicleId;
  List<InspectionDetails> inspectionDetailsList = [];
  final TextEditingController policyNumberController = TextEditingController();
  final TextEditingController policeReportController = TextEditingController();

  final TextEditingController odometerController = TextEditingController();
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController driverPhoneController = TextEditingController();
  final TextEditingController commandController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HeadingText(
                heading: ' Customer',
                colorName: CustomColors.blackColor,
                fontSize: 12,
              ),
              CustomIconButton(
                addButton: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CustomerFormDialog();
                      });
                },
              ),
              const SizedBox(width: 550),
              HeadingText(
                  heading: ' Vehicle',
                  colorName: CustomColors.blackColor,
                  fontSize: 13),
              CustomIconButton(
                addButton: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const MainScreenOfVehicleAdding();
                      });
                },
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 550,
                child: SearchableCustomerDropdown(
                  hintText: 'Select a Customer',
                  onItemSelected: (String customerId) {
                    setState(() {
                      selectedCustomerId = customerId;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 100),
              SizedBox(
                width: 550,
                child: SearchableVehicleDropdown(
                    hintText1: 'Select a Vehicle',
                    onItemSelected: (String vehicleId) {
                      setState(() {
                        selectedVehicleId = vehicleId;
                      });
                    },
                    validator: (value) {
                      if (selectedVehicleId == null ||
                          selectedVehicleId!.isEmpty) {
                        return 'required';
                      }
                      return null;
                    }),
              ),
            ],
          ),
          const SizedBox(height: 30),
          HeadingText(
              heading: ' Customer Command',
              colorName: CustomColors.blackColor,
              fontSize: 13),
          const SizedBox(height: 10),
           CustomerCommandField(controller: commandController,),
          const SizedBox(height: 10),
          Row(
            children: [
              HeadingText(
                  heading: ' Odometer',
                  colorName: CustomColors.blackColor,
                  fontSize: 13),
              const SizedBox(width: 340),
              HeadingText(
                  heading: ' Driver Name',
                  colorName: CustomColors.blackColor,
                  fontSize: 13),
              const SizedBox(width: 330),
              HeadingText(
                  heading: ' Driver Phone',
                  colorName: CustomColors.blackColor,
                  fontSize: 13),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                  width: 350,
                  child: ThreeTextFromField(
                    textHint: 'Odometer Reading',
                    controller: odometerController,
                  )),
              const SizedBox(width: 65),
              SizedBox(
                  width: 350,
                  child: ThreeTextFromField(
                    textHint: 'Driver Name',
                    controller: driverNameController,
                  )),
              const SizedBox(width: 65),
              SizedBox(
                  width: 350,
                  child: ThreeTextFromField(
                    textHint: 'Driver Phone',
                    controller: driverPhoneController,
                  )),
            ],
          ),
          // Insurance section
          HeadingText(
            heading: 'Is Insured',
            colorName: CustomColors.blackColor,
            fontSize: 12,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Checkbox
              EnquiryCheckBox(
                isChecked: isInsured,
                onChanged: (value) {
                  setState(() {
                    isInsured = value;
                  });
                },
              ),

              const SizedBox(width: 22),

              if (isInsured) ...[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          HeadingText(
                            heading: 'Select Insurance company',
                            colorName: CustomColors.blackColor,
                            fontSize: 13,
                          ),
                          const SizedBox(width: 05),
                          HeadingText(
                            heading: '*',
                            colorName: CustomColors.redColor,
                            fontSize: 13,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchableInsuranceDropdown(
                              hintText: 'Select Insurance Company',
                              onItemSelected: (String insuranceCompanyId) {
                                setState(() {
                                  selectedInsuranceId = insuranceCompanyId;
                                });
                              },
                              validator: (value) {
                                if (isInsured &&
                                    (value == null || value.isEmpty)) {
                                  return "required";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          HeadingText(
                            heading: 'Police Report number',
                            colorName: CustomColors.blackColor,
                            fontSize: 13,
                          ),
                          const SizedBox(width: 05),
                          HeadingText(
                            heading: '*',
                            colorName: CustomColors.redColor,
                            fontSize: 13,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 350,
                        child: PoliceReportField(
                          controller: policeReportController,
                          isInsured: true,
                          validator: (value) {
                            if (isInsured && (value == null || value.isEmpty)) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 15),

                // Policy Number
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          HeadingText(
                            heading: 'Policy number',
                            colorName: CustomColors.blackColor,
                            fontSize: 13,
                          ),
                          const SizedBox(width: 05),
                          HeadingText(
                            heading: '*',
                            colorName: CustomColors.redColor,
                            fontSize: 13,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 350,
                        child: PolicyNoTextField(
                          controller: policyNumberController,
                          validator: (value) {
                            if (isInsured && (value == null || value.isEmpty)) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  policyNumberController.clear();
                  policeReportController.clear();
                  setState(() {
                    selectedVehicleId = null;
                    selectedCustomerId = null;
                    selectedInsuranceId = null;
                  });
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(08),
                    ),
                    backgroundColor: CustomColors.whiteColor,
                    fixedSize: const Size(130, 55)),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: CustomColors.blackColor,
                      fontFamily: 'PoppinsMedium',
                      fontSize: 09.sp),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(08),
                    ),
                    backgroundColor: CustomColors.redColor,
                    fixedSize: const Size(130, 55)),
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      areAllFieldsFilled()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          contentPadding: const EdgeInsets.all(20),
                          title: Icon(
                            Icons.error_outline,
                            size: 70,
                            color: CustomColors.yellowColor,
                          ),
                          content: Text(
                            'Are you sure you want to go to inspection step..?',
                            style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                fontSize: 15,
                                color: CustomColors.blackColor),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text("No, Save as Draft",
                                  style: TextStyle(
                                      color: CustomColors.blackColor,
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: 15)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.redColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),

                              onPressed: () async {
                                if (_formKey.currentState!.validate() &&
                                    areAllFieldsFilled()) {
                                  final enquiryService = EnquiryService();
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  // int userId = prefs.getInt('user_id') ?? 0;
                                  // int firmId = prefs.getInt('firm_id') ?? 0;
                                  int firmId = 3;
                                  // int userId =1;

                                  try {
                                    final response =
                                        await enquiryService.saveEnquiry(
                                            customerId: selectedCustomerId,
                                            vehicleId: selectedVehicleId!,
                                            firmId: firmId,

                                            odoMeter: odometerController.text,
                                            description: commandController.text,
                                            isInsured: isInsured,
                                            policyNumber: isInsured
                                                ? policyNumberController.text
                                                : null,
                                            policeReportNumber: isInsured
                                                ? policeReportController.text
                                                : null);
                                    if (response['success']) {
                                      // Show success message
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Enquiry saved successfully!")),
                                      );
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      setState(() {
                                        selectedCustomerId = null;
                                        selectedVehicleId = null;
                                        isInsured = false;
                                        selectedInsuranceId = null;
                                        policyNumberController.clear();
                                        policeReportController.clear();
                                        odometerController.clear();
                                        commandController.clear();
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Error: ${response['message']}")),
                                      );
                                      Navigator.of(context).pop();
                                    }
                                  } catch (error) {
                                    // Handle any exceptions
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Error: $error")),
                                    );
                                    Navigator.of(context)
                                        .pop();
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Please fill all required fields")),
                                  );
                                  Navigator.of(context)
                                      .pop(); // Close just the confirmation dialog
                                }
                              },
                              child: Text(
                                "Yes, go!",
                                style: TextStyle(
                                  color: CustomColors.whiteColor,
                                  fontSize: 15,
                                  fontFamily: 'PoppinsMedium',
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Please fill all required fields")),
                    );
                  }
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: CustomColors.whiteColor,
                      fontFamily: 'PoppinsMedium',
                      fontSize: 09.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool areAllFieldsFilled() {
    return selectedCustomerId != null &&
        (!isInsured ||
            (selectedInsuranceId != null &&
                policyNumberController.text.isNotEmpty &&
                policeReportController.text.isNotEmpty));
  }
}
