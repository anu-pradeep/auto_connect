import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../api_service_classes/vehicle_list_api.dart';
import '../common_custom_widgets/colors.dart';

class SearchableVehicleDropdown extends StatefulWidget {
  final String hintText1;
  final Function(String) onItemSelected;

  const SearchableVehicleDropdown(
      {super.key,
      required this.hintText1,
      required this.onItemSelected,
      required String? Function(String) validator});

  @override
  State<SearchableVehicleDropdown> createState() =>
      _SearchableVehicleDropdownState();
}

class _SearchableVehicleDropdownState extends State<SearchableVehicleDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  List<Map<String, dynamic>> vehicles = [];
  List<Map<String, dynamic>> filteredVehicles = [];
  String? selectedVehicle;

  final VehicleListClass _vehicleListClass = VehicleListClass();
  final ScrollController _isScrollController = ScrollController();
  bool hasMore = true;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchVehicleData();
    _searchController.addListener(_filterVehicles);
    _isScrollController.addListener(() {
      if (_isScrollController.position.pixels ==
          _isScrollController.position.maxScrollExtent &&
          hasMore &&
          !loading) {
        loadVehicleData();
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
  Future<void> loadVehicleData() async {
    if (loading) return;
    setState(() {
      loading = true;
    });
    try {
      final response = await _vehicleListClass.fetchVehicleList();
      setState(() {
        vehicles.addAll(response);
        filteredVehicles = vehicles;
        hasMore = response.isNotEmpty;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading vehicle data: $e');
      }
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
  Future<void> fetchVehicleData() async {
    try {
      final vehicleSelection = VehicleListClass();
      final data = await vehicleSelection.fetchVehicleList();
      setState(() {
        vehicles = data;
        filteredVehicles = data;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading vehicle data : $e');
      }
    }
  }

  void _filterVehicles() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredVehicles = vehicles
          .where((vehicle) =>
              ('${vehicle['plate_prefix']}- ${vehicle['register_number']}')
                  .toLowerCase()
                  .contains(query))
          .toList();
    });

    // Update the dropdown with filtered results
    _hideDropdown();
    if (_focusNode.hasFocus) {
      _showDropdown();
    }
  }

  void _selectVehicle(Map<String, dynamic> vehicle) {
    setState(() {
      selectedVehicle = vehicle['id'].toString();
      _searchController.text =
          '${vehicle['plate_prefix']}- ${vehicle['register_number']}';
    });
    _hideDropdown();
    widget.onItemSelected(selectedVehicle!);
    FocusScope.of(context).unfocus();
  }

  void _showDropdown() {
    _hideDropdown(); // Remove any existing dropdown

    // Get the position and size of the text field
    final RenderBox renderBox =
        _fieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    // Create and show the overlay
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
            child: filteredVehicles.isEmpty
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "No vehicles found",
                      style: TextStyle(
                        color: CustomColors.blackColor,
                        fontSize: 15,
                        fontFamily: 'PoppinsMedium',
                      ),
                    ),
                  ))
                : ListView.builder(
              shrinkWrap: true,
              controller: _isScrollController,
              padding: EdgeInsets.zero,
              itemCount: filteredVehicles.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == filteredVehicles.length) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: CustomColors.borderColor,
                      ),
                    ),
                  );
                }
                final vehicle = filteredVehicles[index];
                return ListTile(
                  title: Text(
                    '${vehicle['plate_prefix']}- ${vehicle['register_number']}',
                    style: TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 15,
                      fontFamily: 'PoppinsMedium',
                    ),
                  ),
                  onTap: () => _selectVehicle(vehicle),
                );
              },
            )
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
    return TextField(
      key: _fieldKey,
      controller: _searchController,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText1,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize: 15,
          fontFamily: 'PoppinsBold',
        ),
        errorStyle: TextStyle(
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
