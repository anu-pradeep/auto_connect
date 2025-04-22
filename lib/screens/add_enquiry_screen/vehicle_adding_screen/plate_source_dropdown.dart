import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../api_service_classes/emirates_list_category_api.dart';
import '../../common_custom_widgets/colors.dart';

class PlateSourceDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?) validator;

  const PlateSourceDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
    required this.validator,
  });

  @override
  State<PlateSourceDropdown> createState() => _PlateSourceDropdownState();
}

class _PlateSourceDropdownState extends State<PlateSourceDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  List<Map<String, dynamic>> emirates = [];
  List<Map<String, dynamic>> filteredEmirates = [];
  String? selectedEmirate;
  // List<String> items = []; // Start with an empty list
  // List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    fetchEmiratesCategory();
    _searchController.addListener(_filterEmirates);
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

  Future<void> fetchEmiratesCategory() async {
    try {
      final emirateSelection = EmiratesCategoryClass();
      final data = await emirateSelection.emiratesCategoryList();

      setState(() {
        emirates = data;
        filteredEmirates = data;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading emirates category: $e');
      }
    }
  }


  void _filterEmirates() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredEmirates = emirates
          .where((emirate) => ('${emirate['id']}-${emirate['name']}')
              .toLowerCase()
              .contains(query))
          .toList();
    });

    _hideDropdown();
    if (_focusNode.hasFocus) {
      _showDropdown();
    }
  }

  // void _selectItem(String item) {
  //   setState(() {
  //     _searchController.text = item;
  //   });
  //   _hideDropdown();
  //   widget.onItemSelected(item);
  //   FocusScope.of(context).unfocus();
  // }

  void selectCategory(Map<String, dynamic> emirate) {
    setState(() {
      selectedEmirate = emirate['id'].toString();
      _searchController.text = '${emirate['id']}-${emirate['name']}';
    });
    _hideDropdown();
    widget.onItemSelected(selectedEmirate!);
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
              color: CustomColors.whiteColor,
              border: Border.all(color: CustomColors.borderColor),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: filteredEmirates.isEmpty
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "No category found",
                          style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: 'PoppinsMedium',
                          ),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () => selectCategory(_searchController.text),
                      //   child: const Text("Add New Item"),
                      // ),
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: filteredEmirates.length,
                    itemBuilder: (context, index) {
                      final emirate = filteredEmirates[index];
                      return ListTile(
                        title: Text(
                          // '${emirate['id']}-'
                              '${emirate['name']}',

                          style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: 'PoppinsMedium',
                          ),
                        ),
                        onTap: () => selectCategory(emirate),
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
        // prefixIcon:  Icon(Icons.search, color: CustomColors.borderColor),
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
