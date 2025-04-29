import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../api_service_classes/insurance_company_api.dart';
import '../common_custom_widgets/colors.dart';

class SearchableInsuranceDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?)? validator;

  const SearchableInsuranceDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
    this.validator,
  });

  @override
  State<SearchableInsuranceDropdown> createState() =>
      _SearchableInsuranceDropdownState();
}

class _SearchableInsuranceDropdownState
    extends State<SearchableInsuranceDropdown> {
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
    _searchController.addListener(filterInsurances);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showDropdown();
      } else {
        hideDropdown();
      }
    });
  }

  @override
  void dispose() {
    hideDropdown();
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

  void filterInsurances() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredInsurances = insurances
          .where((insurance) => insurance['name'].toLowerCase().contains(query))
          .toList();
    });

    hideDropdown();
    if (_focusNode.hasFocus) {
      showDropdown();
    }
  }

  void selectInsurance(Map<String, dynamic> insurance) {
    setState(() {
      selectedInsurance = insurance['id'].toString();
      _searchController.text = insurance['name'];
      _errorText = null;
    });
    hideDropdown();
    widget.onItemSelected(selectedInsurance!);
    FocusScope.of(context).unfocus();
  }

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

  void showDropdown() {
    hideDropdown();

    final RenderBox renderBox =
        _fieldKey.currentContext!.findRenderObject() as RenderBox;
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
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No insurance companies found",
                        style: TextStyle(
                          color: CustomColors.blackColor,
                          fontSize: 15,
                          fontFamily: 'PoppinsMedium',
                        ),
                      ),
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
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                        onTap: () => selectInsurance(insurance),
                      );
                    },
                  ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (_) => widget.validator != null
          ? widget.validator!(selectedInsurance)
          : null,
      builder: (FormFieldState<String> state) {
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
                  fontFamily: 'PoppinsRegular',
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_drop_down,
                      color: CustomColors.borderColor),
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
                  borderSide: BorderSide(
                      color: _errorText != null
                          ? CustomColors.redColor
                          : CustomColors.borderColor,
                      width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                      color: _errorText != null
                          ? CustomColors.redColor
                          : CustomColors.borderColor,
                      width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                      color: _errorText != null
                          ? CustomColors.redColor
                          : CustomColors.borderColor,
                      width: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      BorderSide(color: CustomColors.redColor, width: 0.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      BorderSide(color: CustomColors.redColor, width: 0.5),
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
                    fontFamily: 'PoppinsRegular',
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}


