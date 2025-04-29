import 'package:auto_connect/api_service_classes/care_of_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common_custom_widgets/colors.dart';

class CareOfDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?)? validator;

  const CareOfDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
    this.validator,
  });

  @override
  State<CareOfDropdown> createState() => _CareOfDropdownState();
}

class _CareOfDropdownState extends State<CareOfDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  final CareOfsApi _careOfsApi = CareOfsApi();
  List<Map<String, dynamic>> careOf = [];
  List<Map<String, dynamic>> filteredCareOf = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCareOf();
    _searchController.addListener(filterCareOf);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showDropdown();
      } else {
        hideDropdown();
      }
    });
  }

  Future<void> fetchCareOf() async {
    try {
      List<Map<String, dynamic>> fetchedData = await _careOfsApi.fetchCareOfs();
      setState(() {
        careOf = fetchedData;
        filteredCareOf = List.from(careOf);
        _isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching Care Ofs: $e');
      }
    }
  }

  void filterCareOf() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCareOf = careOf
          .where((item) => item['name'].toLowerCase().contains(query))
          .toList();
    });
    hideDropdown();
    if (_focusNode.hasFocus) {
      showDropdown();
    }
  }

  void selectCareItem(Map<String, dynamic> item) {
    setState(() {
      _searchController.text = item['name'];
    });
    hideDropdown();
    widget.onItemSelected(item['id'].toString());

    FocusScope.of(context).unfocus();
  }

  void showDropdown() {
    hideDropdown();

    final RenderBox renderBox =
        _fieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 5,
          width: size.width,
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              decoration: BoxDecoration(
                color: CustomColors.whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : filteredCareOf.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "No items found",
                            style: TextStyle(
                              color: CustomColors.blackColor,
                              fontSize: 15,
                              fontFamily: 'PoppinsRegular',
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: filteredCareOf.length,
                          itemBuilder: (context, index) {
                            final item = filteredCareOf[index];
                            return ListTile(
                              dense: true,
                              title: Text(
                                item['name'],
                                style: const TextStyle(
                                  fontFamily: 'PoppinsRegular',
                                ),
                              ),
                              onTap: () => selectCareItem(item),
                            );
                          },
                        ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _searchController.removeListener(filterCareOf);
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: CustomColors.borderColor),
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
