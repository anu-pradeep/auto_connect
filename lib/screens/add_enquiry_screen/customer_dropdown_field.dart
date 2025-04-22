
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../api_service_classes/customer_list_api.dart';
import '../common_custom_widgets/colors.dart';

class SearchableCustomerDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?)? validator;

  const SearchableCustomerDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
    this.validator,
  });

  @override
  State<SearchableCustomerDropdown> createState() =>
      _SearchableCustomerDropdownState();
}
class _SearchableCustomerDropdownState extends State<SearchableCustomerDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  List<Map<String, dynamic>> customers = [];
  List<Map<String, dynamic>> filteredCustomers = [];
  String? selectedCustomer;
  String? _errorText;

  final CustomerListClass _customerListClass = CustomerListClass();
  final ScrollController _customerScrollController = ScrollController();
  bool moreCustomer = true;
  bool customerLoading = false;
  int _currentPage = 1;
  Timer? _scrollDebounce;

  @override
  void initState() {
    super.initState();
    fetchCustomerData();

    _searchController.addListener(_filterCustomers);

    _customerScrollController.addListener(() {
      if (_customerScrollController.position.pixels >
          _customerScrollController.position.maxScrollExtent - 100 &&
          moreCustomer &&
          !customerLoading) {
        loadCustomerList();
      }
    });

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
    _customerScrollController.dispose();
    _scrollDebounce?.cancel();
    super.dispose();
  }

  Future<void> loadCustomerList() async {
    if (customerLoading || !moreCustomer) return;

    setState(() {
      customerLoading = true;
    });

    try {
      _currentPage++;

      final response = await _customerListClass.fetchCustomerList(3, page: _currentPage);

      setState(() {
        customers.addAll(response);
        filteredCustomers = customers;
        moreCustomer = response.isNotEmpty;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading customer list: $e');
      }
    } finally {
      setState(() {
        customerLoading = false;
      });
    }
  }

  Future<void> fetchCustomerData() async {
    try {
      final data = await _customerListClass.fetchCustomerList(3, page: 1);
      setState(() {
        customers = data;
        filteredCustomers = data;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading customer data: $e');
      }
    }
  }

  void _filterCustomers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCustomers = customers
          .where((customer) => customer['name'].toLowerCase().contains(query))
          .toList();
    });

    _hideDropdown();
    if (_focusNode.hasFocus) {
      _showDropdown();
    }
  }

  void _selectCustomer(Map<String, dynamic> customer) {
    setState(() {
      selectedCustomer = customer['id'].toString();
      _searchController.text = customer['name'];
      _errorText = null;
    });
    _hideDropdown();
    widget.onItemSelected(selectedCustomer!);
    FocusScope.of(context).unfocus();
  }

  String? validate() {
    if (widget.validator != null) {
      final error = widget.validator!(selectedCustomer);
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
            child: filteredCustomers.isEmpty
                ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "No customers found",
                  style: TextStyle(
                    color: CustomColors.blackColor,
                    fontSize: 15,
                    fontFamily: 'PoppinsMedium',
                  ),
                ),
              ),
            )
                :
            ListView.builder(
              shrinkWrap: true,
              controller: _customerScrollController,
              padding: EdgeInsets.zero,
              itemCount: filteredCustomers.length + (moreCustomer ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == filteredCustomers.length) {
                  return  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(color: CustomColors.borderColor,),
                    ),
                  );
                }
                final customer = filteredCustomers[index];
                return ListTile(
                  title: Text(customer['name']),
                  onTap: () => _selectCustomer(customer),
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
      validator: (_) =>
      widget.validator != null ? widget.validator!(selectedCustomer) : null,
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
                  fontFamily: 'PoppinsMedium',
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
