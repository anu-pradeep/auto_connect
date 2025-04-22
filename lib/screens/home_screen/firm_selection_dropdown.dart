import 'package:flutter/material.dart';
import '../common_custom_widgets/colors.dart';

class SearchableFirmDropdown extends StatefulWidget {
  final String hintText;
  final List<Map<String, dynamic>> firms;
  final Function(String) onItemSelected;

  const SearchableFirmDropdown({
    super.key,
    required this.hintText,
    required this.firms,
    required this.onItemSelected,
  });

  @override
  State<SearchableFirmDropdown> createState() => _SearchableFirmDropdownState();
}

class _SearchableFirmDropdownState extends State<SearchableFirmDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  List<Map<String, dynamic>> filteredFirms = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterFirms);
    filteredFirms = widget.firms;
  }

  void _filterFirms() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredFirms = widget.firms
          .where((firm) => firm['name'].toLowerCase().contains(query))
          .toList();
    });

    _showDropdown();
  }

  void _selectFirm(Map<String, dynamic> firm) {
    setState(() {
      _searchController.text = firm['name'];
    });
    _hideDropdown();
    widget.onItemSelected(firm['name']);
    FocusScope.of(context).unfocus();
  }

  void _showDropdown() {
    _hideDropdown();
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + renderBox.size.height,
        width: renderBox.size.width,
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
            child: filteredFirms.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "No firms found",
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
                    itemCount: filteredFirms.length,
                    itemBuilder: (context, index) {
                      final firm = filteredFirms[index];
                      return ListTile(
                        title: Text(
                          firm['name'],
                          style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: 'PoppinsMedium',
                          ),
                        ),
                        onTap: () => _selectFirm(firm),
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
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _hideDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: CustomColors.textFormTextColor,
          fontSize: 15,
          fontFamily: 'PoppinsMedium',
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
        suffixIcon:
            Icon(Icons.arrow_drop_down, color: CustomColors.borderColor),
      ),
    );
  }
}
