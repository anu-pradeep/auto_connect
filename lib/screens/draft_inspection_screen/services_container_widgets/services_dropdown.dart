import 'package:flutter/material.dart';
import '../../common_custom_widgets/colors.dart';

class ServicesDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  // final String? Function(String?) validator;

  const ServicesDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
    // required this.validator,
  });

  @override
  State<ServicesDropdown> createState() =>
      _ServicesDropdownState();
}

class _ServicesDropdownState extends State<ServicesDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  List<String> items = []; // Start with an empty list
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterItems);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showDropdown();
      } else {
        _hideDropdown();
      }
    });
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems =
          items.where((item) => item.toLowerCase().contains(query)).toList();
    });

    _hideDropdown();
    if (_focusNode.hasFocus) {
      _showDropdown();
    }
  }

  void _selectItem(String item) {
    setState(() {
      _searchController.text = item;
    });
    _hideDropdown();
    widget.onItemSelected(item);
    FocusScope.of(context).unfocus();
  }

  void _addNewItem(String newItem) {
    setState(() {
      items.add(newItem);
      _selectItem(newItem);
    });
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
            child: filteredItems.isEmpty
                ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("No items found"),
                ),
                TextButton(
                  onPressed: () => _addNewItem(_searchController.text),
                  child: const Text("Add New Item"),
                ),
              ],
            )
                : ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ListTile(
                  title: Text(
                    item,
                    style: TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 15,
                      fontFamily: 'PoppinsMedium',
                    ),
                  ),
                  onTap: () => _selectItem(item),
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
      // validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize: 15,
          fontFamily: 'PoppinsBold',
        ),
        // prefixIcon:  Icon(Icons.search, color: CustomColors.borderColor),
        suffixIcon: IconButton(
          icon:  Icon(Icons.arrow_drop_down, color: CustomColors.borderColor),
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
        ), enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
      ),focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
      ),
      ),
    );
  }
}
