import 'package:auto_connect/screens/add_enquiry_screen/customer_adding_screen/staff_dropdown.dart';
import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:auto_connect/screens/common_custom_widgets/text_span_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../../../api_service_classes/customer_save_api.dart';
import '../../../api_service_classes/customer_type_api.dart';
import 'credit_cash_dropdown.dart';
import 'care_of_dropdown.dart';
import 'customer_image_picker.dart';
import 'customer_type_dropdown.dart';


void showCustomerFormDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomerFormDialog();
    },
  );
}

class CustomerFormDialog extends StatefulWidget {
  const CustomerFormDialog({Key? key}) : super(key: key);

  @override
  State<CustomerFormDialog> createState() => _CustomerFormDialogState();
}

class _CustomerFormDialogState extends State<CustomerFormDialog> {
  final formKey = GlobalKey<FormState>();
  String? selectCustomerType;
  String? selectedCustomerTypeId;
  var selectedCareOf;
  bool _isLoading = false;
  String? cashOrCard;
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fileNoController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController contact1Controller = TextEditingController();
  final TextEditingController contact2Controller = TextEditingController();
  final TextEditingController websiteController = TextEditingController();

  final CustomerSaveService _customerSaveService = CustomerSaveService();
  final CustomerTypeClass _customerTypeClass = CustomerTypeClass();
  List<Map<String, dynamic>> customerTypes = [];

  @override
  void initState() {
    super.initState();
    fetchCustomerTypes();
  }


  Future<void> fetchCustomerTypes() async {
    try {
      List<Map<String, dynamic>> fetchedData = await _customerTypeClass.fetchCustomerType();
      setState(() {
        customerTypes = fetchedData;
      });
    } catch (e) {
      print('Error fetching customer types: $e');
    }
  }

  void saveCustomerForm() async {
    if (formKey.currentState!.validate()) {
      if (selectCustomerType == null || cashOrCard == null) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: const Text('Please fill all required fields'),
            backgroundColor:CustomColors.redColor,
          ),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });
      print("About to send careOfId: $selectedCareOf");
      print("Type of selectedCareOf: ${selectedCareOf.runtimeType}");
      if (selectedCareOf != null) {
        print("Parsed int value: ${int.parse(selectedCareOf.toString())}");
      }
      try {
        final result = await _customerSaveService.saveCustomer(
          firmId: 3,
          name: customerNameController.text.trim(),
          email: emailController.text.trim(),
          phone: phoneController.text.trim(),
          customerTypeId: selectedCustomerTypeId ?? '1',
          contactPerson: selectCustomerType == 'Corporate Customer'
              ? contactPersonController.text.trim()
              : null,
          contactNo: selectCustomerType == 'Corporate Customer'
              ? contact1Controller.text.trim()
              : null,
          creditOrCash: cashOrCard?.toLowerCase(),
          // careOfId: selectedCareOf,
          careOfId: selectedCareOf != null ? int.parse(selectedCareOf.toString()) : null,
        );

        if (result['status']) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Customer saved successfully'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result['message'] ?? 'Failed to save customer'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: $e'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    customerNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    fileNoController.dispose();
    licenseController.dispose();
    dateController.dispose();
    addressController.dispose();
    contactPersonController.dispose();
    contact1Controller.dispose();
    contact2Controller.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      contentPadding: const EdgeInsets.all(20),
      content: Form(
        key: formKey,
        child: SizedBox(
          width: 940,
          height: 800,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                    heading: 'Add Customer',
                    colorName: CustomColors.blackColor,
                    fontSize: 15),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomRichText(
                          mainText: 'Customer type',
                          highlightedText: '*',
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 200,
                          child: CustomerTypeDropdown(
                            hintText: 'Select a customer type',
                            onItemSelected: (value) {

                              final selectedType = customerTypes.firstWhere(
                                    (type) => type['name'] == value,
                                orElse: () => {'id': '1', 'name': value},
                              );

                              setState(() {
                                selectCustomerType = value;
                                selectedCustomerTypeId = selectedType['id'].toString();


                                if (value.toLowerCase().contains('individual')) {
                                  selectCustomerType = 'Individual Customer';
                                } else if (value.toLowerCase().contains('corporate')) {
                                  selectCustomerType = 'Corporate Customer';
                                }
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a customer type';
                              }
                              return null;
                            },
                            items: [],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                if (selectCustomerType == 'Individual Customer') ...[
                  Row(
                    children: [
                      _buildFormField(
                        label: 'Care Of',
                        isRequired: true,
                        width: 200,
                        child:
                        // CareOfDropdown(
                        //   hintText: '-- Select Care Of --',
                        //   onItemSelected: (value) {
                        //     setState(() {
                        //       selectedCareOf = value;
                        //     });
                        //   },
                        //   validator: _requiredValidator,
                        // ),
                        CareOfDropdown(
                          hintText: '-- Select Care Of --',
                          onItemSelected: (String value) {
                            setState(() {
                              selectedCareOf = int.parse(value);
                              print("Setting selectedCareOf to: $selectedCareOf");
                            });
                          },
                          validator: _requiredValidator,
                        ),
                      ),
                      const SizedBox(width: 25),
                      _buildFormField(
                        label: 'Customer Name',
                        isRequired: true,
                        width: 200,
                        child: TextFormField(
                          controller: customerNameController,
                          decoration: _inputDecoration('Customer name'),
                          validator: _requiredValidator,
                        ),
                      ),
                      const SizedBox(width: 25),
                      _buildFormField(
                        label: 'Phone',
                        isRequired: true,
                        width: 200,
                        child: TextFormField(
                          controller: phoneController,
                          decoration: _inputDecoration('Customer phone'),
                          keyboardType: TextInputType.phone,
                          validator: _requiredValidator,
                        ),
                      ),
                      const SizedBox(width: 25),
                      _buildFormField(
                        label: 'Email',
                        isRequired: true,
                        width: 200,
                        child: TextFormField(
                          controller: emailController,
                          decoration: _inputDecoration('Customer email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: _requiredValidator,
                        ),
                      ),
                    ],
                  ),
                ] else if (selectCustomerType == 'Corporate Customer') ...[
                  Row(
                    children: [
                      _buildFormField(
                        label: 'Customer Name',
                        isRequired: true,
                        width: 200,
                        child: TextFormField(
                          controller: customerNameController,
                          decoration: _inputDecoration('Customer name'),
                          validator: _requiredValidator,
                        ),
                      ),
                      const SizedBox(width: 25),
                      _buildFormField(
                        label: 'Phone',
                        isRequired: true,
                        width: 200,
                        child: TextFormField(
                          controller: phoneController,
                          decoration: _inputDecoration('Customer phone'),
                          keyboardType: TextInputType.phone,
                          validator: _requiredValidator,
                        ),
                      ),
                      const SizedBox(width: 25),
                      _buildFormField(
                        label: 'Email',
                        isRequired: true,
                        width: 200,
                        child: TextFormField(
                          controller: emailController,
                          decoration: _inputDecoration('Customer email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: _requiredValidator,
                        ),
                      ),
                      const SizedBox(width: 25),
                      _buildFormField(
                        label: 'Contact Person',
                        isRequired: true,
                        width: 200,
                        child: TextFormField(
                          controller: contactPersonController,
                          decoration: _inputDecoration('Contact Person'),
                          validator: _requiredValidator,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildFormField(
                        label: 'Contact 1',
                        isRequired: true,
                        width: 200,
                        child: TextFormField(
                          controller: contact1Controller,
                          decoration: _inputDecoration('Contact 1'),
                          validator: _requiredValidator,
                        ),
                      ),
                      const SizedBox(width: 25),
                      _buildFormField(
                        label: 'Contact 2',
                        isRequired: false,
                        width: 200,
                        child: TextFormField(
                          controller: contact2Controller,
                          decoration: _inputDecoration('Contact 2'),
                        ),
                      ),
                      const SizedBox(width: 25),
                      _buildFormField(
                        label: 'Website',
                        isRequired: false,
                        width: 200,
                        child: TextFormField(
                          controller: websiteController,
                          decoration: _inputDecoration('Customer website URL'),
                          keyboardType: TextInputType.url,
                        ),
                      ),
                      const SizedBox(width: 25),
                      _buildFormField(
                        label: 'File Number',
                        isRequired: false,
                        width: 200,
                        child: TextFormField(
                          controller: fileNoController,
                          decoration: _inputDecoration('File Number'),
                        ),
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildFormField(
                      label: 'Credit / Cash',
                      isRequired: true,
                      width: 200,
                      child: CreditCashDropdown(
                        hintText: 'Select',
                        items: const ['Credit', 'Cash'],
                        onItemSelected: (value) {
                          setState(() {
                            cashOrCard = value;
                          });
                        },
                        validator: _requiredValidator,
                      ),
                    ),
                    const SizedBox(width: 25),
                    _buildFormField(
                      label: 'License Number',
                      isRequired: false,
                      width: 200,
                      child: TextFormField(
                        controller: licenseController,
                        decoration: _inputDecoration('License Number'),
                      ),
                    ),
                    const SizedBox(width: 25),
                    _buildFormField(
                      label: 'Trade License Expiry',
                      isRequired: false,
                      width: 200,
                      child: TextFormField(
                        controller: dateController,
                        decoration: _inputDecoration('dd-mm-yyyy').copyWith(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(context, dateController);
                            },
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingText(
                            heading: 'Follow up staff',
                            colorName: CustomColors.blackColor,
                            fontSize: 12),
                        const SizedBox(
                          height: 08,
                        ),
                        SizedBox(
                            width: 200,
                            child: StaffListDropdown(
                              hintText: 'follow up staff',
                              onItemSelected: (String) {},
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                _buildFormField(
                  label: 'Address',
                  isRequired: false,
                  width: 880,
                  child: TextFormField(
                    controller: addressController,
                    decoration: _inputDecoration('Customer address'),
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 20),
                const CustomerImagePicker(),
                // Buttons
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(08),
                          ),
                          backgroundColor: CustomColors.whiteColor,
                          fixedSize: const Size(130, 55)),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontFamily: 'PoppinsMedium',
                            fontSize: 09),
                      ),
                    ),
                    const SizedBox(width: 10),
                    _buildSaveButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : saveCustomerForm,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(08),
        ),
        backgroundColor: CustomColors.redColor,
        fixedSize: const Size(130, 55),
      ),
      child: _isLoading
          ? CircularProgressIndicator(color:CustomColors.whiteColor)
          : Text(
        'Save Customer',
        style: TextStyle(
            color: CustomColors.whiteColor,
            fontFamily: 'PoppinsMedium',
            fontSize: 09
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required bool isRequired,
    required Widget child,
    required double width,
  }) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(
                    color: CustomColors.blackColor,
                    fontSize: 12,
                    fontFamily: 'PoppinsMedium',
                  ),
                ),
                if (isRequired)
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: CustomColors.redColor,
                      fontSize: 12,
                      fontFamily: 'PoppinsMedium',
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          child,
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
          color: CustomColors.borderColor,
          fontFamily: 'PoppinsMedium',
          fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: CustomColors.redColor,
              onPrimary: CustomColors.whiteColor,
              onSurface: CustomColors.blackColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: CustomColors.redColor,
              ),
            ),
            textTheme: TextTheme(
              headlineMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'PoppinsMedium',
                color: CustomColors.blackColor,
              ),
              bodyLarge: TextStyle(
                fontSize: 16,
                fontFamily: 'PoppinsMedium',
                color: CustomColors.blackColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}