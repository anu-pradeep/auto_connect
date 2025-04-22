// searchable dropdown
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../api_service_classes/insurance_company_api.dart';
import '../common_custom_widgets/colors.dart';

class SearchableInsuranceDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?)? validator;

  const SearchableInsuranceDropdown({
    Key? key,
    required this.hintText,
    required this.onItemSelected,
    this.validator,
  }) : super(key: key);

  @override
  State<SearchableInsuranceDropdown> createState() => _SearchableInsuranceDropdownState();
}

class _SearchableInsuranceDropdownState extends State<SearchableInsuranceDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();

  List<Map<String, dynamic>> insurances = [];
  List<Map<String, dynamic>> filteredInsurances = [];
  String? selectedInsurance;
  OverlayEntry? _overlayEntry;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    fetchInsuranceData();
    _searchController.addListener(_filterInsurances);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showDropdown();
      } else {
        _hideDropdown();
      }
    });
  }

  @override
  void dispose() {
    _hideDropdown();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> fetchInsuranceData() async {
    try {
      final insuranceSelection = InsuranceCompanyList();
      final data = await insuranceSelection.fetchInsuranceCompany(3);
      setState(() {
        insurances = data;
        filteredInsurances = data;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading insurance data: $e');
      }
    }
  }

  void _filterInsurances() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredInsurances = insurances
          .where((insurance) => insurance['name'].toLowerCase().contains(query))
          .toList();
    });

    _hideDropdown();
    if (_focusNode.hasFocus) {
      _showDropdown();
    }
  }

  void _selectInsurance(Map<String, dynamic> insurance) {
    setState(() {
      selectedInsurance = insurance['id'].toString();
      _searchController.text = insurance['name'];
      _errorText = null; // Clear error when an insurance company is selected
    });
    _hideDropdown();
    widget.onItemSelected(selectedInsurance!);
    FocusScope.of(context).unfocus();
  }

  // Validate method that can be called from a FormField
  String? validate() {
    if (widget.validator != null) {
      final error = widget.validator!(selectedInsurance);
      setState(() {
        _errorText = error;
      });
      return error;
    }
    return null;
  }

  void _showDropdown() {
    _hideDropdown();

    final RenderBox renderBox = _fieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: CustomColors.borderColor),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: filteredInsurances.isEmpty
                ? const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("No insurance companies found"),
              ),
            )
                : ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: filteredInsurances.length,
              itemBuilder: (context, index) {
                final insurance = filteredInsurances[index];
                return ListTile(
                  title: Text(
                    insurance['name'],
                    style: TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 15,
                      fontFamily: 'PoppinsMedium',
                    ),
                  ),
                  onTap: () => _selectInsurance(insurance),
                );
              },
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (_) => widget.validator != null ? widget.validator!(selectedInsurance) : null,
      builder: (FormFieldState<String> state) {
        // Update error state when form validation runs
        if (state.hasError && _errorText != state.errorText) {
          _errorText = state.errorText;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              key: _fieldKey,
              controller: _searchController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: CustomColors.textFormTextColor,
                  fontSize: 15,
                  fontFamily: 'PoppinsBold',
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_drop_down, color: CustomColors.borderColor),
                  onPressed: () {
                    if (_focusNode.hasFocus) {
                      _focusNode.unfocus();
                    } else {
                      _focusNode.requestFocus();
                    }
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: _errorText != null ? CustomColors.redColor : CustomColors.borderColor, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: _errorText != null ? CustomColors.redColor : CustomColors.borderColor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: _errorText != null ? CustomColors.redColor : CustomColors.borderColor, width: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: CustomColors.redColor, width: 0.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: CustomColors.redColor, width: 0.5),
                ),
              ),
            ),
            if (_errorText != null || state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8),
                child: Text(
                  _errorText ?? state.errorText ?? "",
                  style: TextStyle(
                    color: CustomColors.redColor,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

// my success dropdown
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import '../../api_service_classes/insurance_company_api.dart';
// import '../common_custom_widgets/colors.dart';
//
// class InsuranceDropdownField extends StatefulWidget {
//   final String hintText;
//   const InsuranceDropdownField({super.key, required this.hintText});
//
//   @override
//   State<InsuranceDropdownField> createState() => _InsuranceDropdownFieldState();
// }
//
// class _InsuranceDropdownFieldState extends State<InsuranceDropdownField> {
//   List<Map<String, dynamic>> insuranceCompany = [];
//   String? selectedInsuranceCompany;
//   bool isInsured = false;
//   @override
//   void initState() {
//     super.initState();
//     fetchInsuranceCompanyData();
//   }
//
//   Future<void> fetchInsuranceCompanyData() async {
//     try {
//       final insuranceCompanyList = InsuranceCompanyList();
//       final data = await insuranceCompanyList.fetchInsuranceCompany(3);
//       setState(() {
//         insuranceCompany = data;
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error loading Insurance company :$e');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 370,
//       child: DropdownButtonFormField<String>(
//         isExpanded: true,
//         dropdownColor: CustomColors.whiteColor,
//         menuMaxHeight: 250,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(08.0),
//             borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(08.0),
//             borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
//           ),
//         ),
//         validator: (value) {
//           if (isInsured && value == null) {
//             return "Required";
//           }
//           return null;
//         },
//         hint: Text(
//           widget.hintText,
//           style: TextStyle(
//               color: CustomColors.borderColor,
//               fontSize: 13,
//               fontFamily: 'PoppinsMedium'),
//         ),
//         value: selectedInsuranceCompany,
//         items: insuranceCompany.map((company) => DropdownMenuItem<String>(
//               value: company['id'].toString(),
//               child: Text(
//                 company['name'],
//                 style: TextStyle(
//                     color: CustomColors.blackColor,
//                     fontSize: 15,
//                     fontFamily: 'PoppinsMedium'),
//               ),
//             )).toList(),
//         onChanged: (String? value) {
//           setState(() {
//             selectedInsuranceCompany = value;
//           });
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import '../../api_service_classes/insurance_company_api.dart';
// import '../checkkkkkkkkkkkkinnnnnnnnnnnnngg.dart';
// import 'searchable_dropdown.dart';
//
// class InsuranceDropdownField extends StatefulWidget {
//   final int firmId;  // Firm ID
//   final String hintText;
//
//   const InsuranceDropdownField({super.key, required this.firmId, required this.hintText});
//
//   @override
//   State<InsuranceDropdownField> createState() => _InsuranceDropdownFieldState();
// }
//
// class _InsuranceDropdownFieldState extends State<InsuranceDropdownField> {
//   List<String> _insuranceCompanies = [];
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchInsuranceCompanies();
//   }
//
//   Future<void> _fetchInsuranceCompanies() async {
//     try {
//       InsuranceCompanyList api = InsuranceCompanyList();
//       List<Map<String, dynamic>> companies = await api.fetchInsuranceCompany(widget.firmId);
//
//       setState(() {
//         _insuranceCompanies = companies.map((c) => c['name'] as String).toList();
//         _isLoading = false;
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error fetching companies: $e');
//       }
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   void _onCompanySelected(String companyName) {
//     print("Selected company: $companyName");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 350,
//       child: SearchableDropdown(
//         hintText: widget.hintText,
//         items: _insuranceCompanies,
//         onItemSelected: _onCompanySelected,
//       ),
//     );
//   }
// }
