import 'package:flutter/material.dart';
import '../../common_custom_widgets/colors.dart';

class SearchableYearDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?) validator;

  const SearchableYearDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
    required this.validator,
  });

  @override
  State<SearchableYearDropdown> createState() => _SearchableYearDropdownState();
}

class _SearchableYearDropdownState extends State<SearchableYearDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  late List<String> years;
  late List<String> filteredYears;
  String? selectedYear;

  @override
  void initState() {
    super.initState();
    initializeYears();
    _searchController.addListener(filterYears);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showDropdown();
      } else {
        hideDropdown();
      }
    });
  }


  void initializeYears() {
    int currentYear = DateTime.now().year;
    years = List.generate(currentYear - 1990 + 1, (index) => (currentYear - index).toString());
    filteredYears = List.from(years);
  }

  void filterYears() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredYears = years.where((year) => year.contains(query)).toList();
    });

    hideDropdown();
    if (_focusNode.hasFocus) {
      showDropdown();
    }
  }

  void selectYear(String year) {
    setState(() {
      selectedYear = year;
      _searchController.text = year;
    });
    hideDropdown();
    widget.onItemSelected(selectedYear!);
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
              color: Colors.white,
              border: Border.all(color: CustomColors.borderColor),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: filteredYears.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No years found",
                        style: TextStyle(
                          color: CustomColors.textFormTextColor,
                          fontSize: 15,
                          fontFamily: 'PoppinsRegular',

                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: filteredYears.length,
                    itemBuilder: (context, index) {
                      final year = filteredYears[index];
                      return ListTile(
                        title: Text(
                          year,
                          style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: 'PoppinsRegular',

                          ),
                        ),
                        onTap: () => selectYear(year),
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
      validator: widget.validator,
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
