import 'package:auto_connect/api_service_classes/customer_type_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common_custom_widgets/colors.dart';

class CustomerTypeDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?)? validator;
  final List<String> items;

  const CustomerTypeDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
    this.validator,
    required this.items,
  });

  @override
  State<CustomerTypeDropdown> createState() => _CustomerTypeDropdownState();
}

class _CustomerTypeDropdownState extends State<CustomerTypeDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  final CustomerTypeClass _customerTypeClass = CustomerTypeClass();
  List<Map<String, dynamic>> customerType = [];
  List<Map<String, dynamic>> filteredCustomerType = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCustomerType();
    _searchController.addListener(filterCustomerType);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showDropdown();
      } else {
        hideDropdown();
      }
    });
  }

  Future<void> fetchCustomerType() async {
    try {
      List<Map<String, dynamic>> fetchedData =
          await _customerTypeClass.fetchCustomerType();
      setState(() {
        customerType = fetchedData;
        filteredCustomerType = List.from(customerType);
        _isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching Customer types: $e');
      }
    }
  }

  void filterCustomerType() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCustomerType = customerType
          .where((type) => type['name'].toLowerCase().contains(query))
          .toList();
    });

    hideDropdown();
    if (_focusNode.hasFocus) {
      showDropdown();
    }
  }

  void selectItem(String item) {
    setState(() {
      _searchController.text = item;
    });
    hideDropdown();
    widget.onItemSelected(item);
    FocusScope.of(context).unfocus();
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
              color: CustomColors.whiteColor,
              border: Border.all(color: CustomColors.borderColor),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: filteredCustomerType.isEmpty
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "No items found",
                          style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: filteredCustomerType.length,
                    itemBuilder: (context, index) {
                      final item = filteredCustomerType[index]['name'];
                      return ListTile(
                        dense: true,
                        title: Text(
                          item,
                          style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                        onTap: () => selectItem(item),
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
  void dispose() {
    _searchController.removeListener(filterCustomerType);
    _searchController.dispose();
    _focusNode.dispose();
    hideDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _fieldKey,
      controller: _searchController,
      focusNode: _focusNode,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize: 12,
          fontFamily: 'PoppinsRegular',
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
          borderSide: BorderSide(color: CustomColors.borderColor, width: 2.0),
        ),
      ),
    );
  }
}
