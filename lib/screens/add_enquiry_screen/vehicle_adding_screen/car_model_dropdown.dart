import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../api_service_classes/car_model_api.dart';
import '../../common_custom_widgets/colors.dart';

class CarModelsDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;

  const CarModelsDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
  });

  @override
  State<CarModelsDropdown> createState() => _CarModelsDropdownState();
}

class _CarModelsDropdownState extends State<CarModelsDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  List<Map<String, dynamic>> vehicle_models = [];
  List<Map<String, dynamic>> filteredModels = [];
  String? selectedModels;

  final CarModelClass _carModelClass = CarModelClass();
  final ScrollController _modelScrollController = ScrollController();
  bool moreModels = true;
  bool modelsLoading = false;

  @override
  void initState() {
    super.initState();
    fetchModelsList();
    _searchController.addListener(_filterModels);
    _modelScrollController.addListener(() {
      if (_modelScrollController.position.pixels ==
              _modelScrollController.position.maxScrollExtent &&
          moreModels &&
          !modelsLoading) {
        loadModelsList();
      }
    });
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
    _modelScrollController.dispose();
    super.dispose();
  }

//scroll controller
  Future<void> loadModelsList() async {
    if (modelsLoading) return;
    setState(() {
      modelsLoading = true;
    });
    try {
      final response = await _carModelClass.carModelList();
      setState(() {
        vehicle_models.addAll(response);
        filteredModels = vehicle_models;
        moreModels = response.isNotEmpty;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading vehicle brand models: $e');
      }
    } finally {
      setState(() {
        modelsLoading = false;
      });
    }
  }

  Future<void> fetchModelsList() async {
    try {
      final modelSelection = CarModelClass();
      final data = await modelSelection.carModelList();
      setState(() {
        vehicle_models = data;
        filteredModels = data;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading vehicle brand models : $e');
      }
    }
  }

  void _filterModels() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredModels = vehicle_models
          .where((models) => ('${models['vehicle_brand_id']}-${models['name']}')
              .toLowerCase()
              .contains(query))
          .toList();
    });
    hideDropdown();
    if (_focusNode.hasFocus) {
      showDropdown();
    }
  }

  void _selectModels(Map<String, dynamic> models) {
    setState(() {
      selectedModels = models['vehicle_brand_id'].toString();
      _searchController.text = '${models['name']}';
    });
    hideDropdown();
    widget.onItemSelected(selectedModels!);
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
            child: filteredModels.isEmpty
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "No models found",
                      style: TextStyle(
                        color: CustomColors.blackColor,
                        fontSize: 15,
                        fontFamily: 'PoppinsRegular',
                      ),
                    ),
                  ))
                : ListView.builder(
                    shrinkWrap: true,
                    controller: _modelScrollController,
                    padding: EdgeInsets.zero,
                    itemCount: filteredModels.length + (moreModels ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == filteredModels.length) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: CustomColors.borderColor,
                            ),
                          ),
                        );
                      }
                      final carModels = filteredModels[index];
                      return ListTile(
                        title: Text(
                          '${carModels['vehicle_brand_id']}-${carModels['name']}',
                          style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                        onTap: () => _selectModels(carModels),
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
    return TextFormField(
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
