import 'dart:async';

import 'package:auto_connect/api_service_classes/car_brands_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../common_custom_widgets/colors.dart';

class SearchableCarCompanyDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?) validator;

  const SearchableCarCompanyDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
    required this.validator,
  });

  @override
  State<SearchableCarCompanyDropdown> createState() =>
      _SearchableCarCompanyDropdownState();
}

class _SearchableCarCompanyDropdownState
    extends State<SearchableCarCompanyDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  List<Map<String, dynamic>> vehicle_brands = [];
  List<Map<String, dynamic>> filteredCarBrands = [];
  String? selectedCarBrands;

  final CarBrandsClass _carBrandsClass = CarBrandsClass();
  final ScrollController _brandScrollController = ScrollController();
  bool moreBrand = true;
  bool brandLoading = false;

  @override
  void initState() {
    super.initState();
    fetchCarBrands();
    _searchController.addListener(_filterCarBrands);
    _brandScrollController.addListener(() {
      if (_brandScrollController.position.pixels ==
              _brandScrollController.position.maxScrollExtent &&
          moreBrand &&
          !brandLoading) {
        loadBrandList();
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
    super.dispose();
  }

// scroll controller function
  Future<void> loadBrandList() async {
    if (brandLoading) return;
    setState(() {
      brandLoading = true;
    });
    try {
      final response = await _carBrandsClass.carBrandsList();
      setState(() {
        vehicle_brands.addAll(response);
        filteredCarBrands = vehicle_brands;
        moreBrand = response.isNotEmpty;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading vehicle brands: $e');
      }
    } finally {
      setState(() {
        brandLoading = false;
      });
    }
  }

  Future<void> fetchCarBrands() async {
    try {
      final brandSelection = CarBrandsClass();
      final data = await brandSelection.carBrandsList();
      setState(() {
        vehicle_brands = data;
        filteredCarBrands = data;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading vehicle brand : $e');
      }
    }
  }

  void _filterCarBrands() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCarBrands = vehicle_brands
          .where((brands) => ('${brands['id']}- ${brands['name']}')
              .toLowerCase()
              .contains(query))
          .toList();
    });
    _hideDropdown();
    if (_focusNode.hasFocus) {
      _showDropdown();
    }
  }

  void _selectVehicleBrand(Map<String,dynamic>brands)
  {
    setState(() {
      selectedCarBrands = brands['id'].toString();
      _searchController.text ='${brands['id']}-${brands['name']}';
    });
    _hideDropdown();
    widget.onItemSelected(selectedCarBrands!);
    FocusScope.of(context).unfocus();
  }



  void _showDropdown() {
    _hideDropdown();

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
              color:  CustomColors.whiteColor,
              border: Border.all(color: CustomColors.borderColor),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: filteredCarBrands.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No car companies found",
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
                    controller: _brandScrollController,
                    padding: EdgeInsets.zero,
                    itemCount: filteredCarBrands.length + (moreBrand?1:0),
                    itemBuilder: (context, index) {
                      if(index == filteredCarBrands.length){
                  return Center(
              child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircularProgressIndicator(
    color: CustomColors.borderColor,
    ),
    ),
    );
    }

                      final brands = filteredCarBrands[index];
                      return ListTile(
                        title: Text(
                          // '${brands['id']}-'
                              '${brands['name']}',
                          style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: 'PoppinsMedium',
                          ),
                        ),
                        onTap: () => _selectVehicleBrand(brands),
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
    return TextFormField(
      key: _fieldKey,
      controller: _searchController,
      focusNode: _focusNode,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize: 15,
          fontFamily: 'PoppinsBold',
        ),
        // prefixIcon: const Icon(Icons.search, color: Colors.grey),
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
      ),
    );
  }
}
