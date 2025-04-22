import 'dart:async';

import 'package:auto_connect/api_service_classes/staff_list_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../common_custom_widgets/colors.dart';

class StaffListDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  // final String? Function(String?) validator;

  const StaffListDropdown({
    super.key,
    required this.hintText,
    required this.onItemSelected,
    // required this.validator,
  });

  @override
  State<StaffListDropdown> createState() => _StaffListDropdownState();
}

class _StaffListDropdownState extends State<StaffListDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  List<Map<String, dynamic>> staffs = [];
  List<Map<String, dynamic>> filteredStaffs = [];
  String? selectedStaffs;
  String? errorText;

  final StaffListClass _staffListClass = StaffListClass();
  final ScrollController _staffScrollController = ScrollController();
  bool moreStaff = true;
  bool staffLoading = false;
  int _currentPage = 1;
  Timer? _scrollDebounce;

  @override
  void initState() {
    super.initState();
    fetchStaffData();
    _searchController.addListener(_filterStaffs);
    _staffScrollController.addListener(() {
      if (_staffScrollController.position.pixels >
              _staffScrollController.position.maxScrollExtent - 100 &&
          moreStaff &&
          !staffLoading) {
        loadStaffList();
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
    _staffScrollController.dispose();
    _scrollDebounce?.cancel();
    super.dispose();
  }

  Future<void> loadStaffList() async {
    if (staffLoading || !moreStaff) return;
    setState(() {
      staffLoading = true;
    });
    try {
      _currentPage++;
      final response = await _staffListClass.fetchStaffList(page: _currentPage);
      setState(() {
        staffs.addAll(response);
        filteredStaffs = staffs;
        moreStaff = response.isNotEmpty;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading staff list: $e');
      }
    } finally {
      setState(() {
        staffLoading = false;
      });
    }
  }

  Future<void> fetchStaffData() async {
    try {
      final data = await _staffListClass.fetchStaffList(page: 1);
      setState(() {
        staffs = data;
        filteredStaffs = data;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading staff data: $e');
      }
    }
  }

  void _filterStaffs() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredStaffs = staffs
          .where((staff) => staff['name'].toLowerCase().contains(query))
          .toList();
    });
    _hideDropdown();
    if (_focusNode.hasFocus) {
      _showDropdown();
    }
  }
void selectStaff(Map<String,dynamic>staff)
{
  setState(() {
    selectedStaffs = staff['id'].toString();
    _searchController.text = staff['name'];
    errorText =null;
  });
  _hideDropdown();
  widget.onItemSelected(selectedStaffs!);
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
            child: filteredStaffs.isEmpty
                ? Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'No customers found',
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
                    controller: _staffScrollController,
                    padding: EdgeInsets.zero,
                    itemCount: filteredStaffs.length + (moreStaff ? 1:0),
                    itemBuilder: (context, index) {
                      if(index == filteredStaffs.length){
                        return  Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(color: CustomColors.borderColor,),
                          ),
                        );
                      }
                      final staff = filteredStaffs[index];
                      return ListTile(
                        title: Text(
                         staff['name'],
                          style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: 'PoppinsMedium',
                          ),
                        ),
                        onTap: () => selectStaff(staff),
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
          fontSize: 12,
          fontFamily: 'PoppinsMedium',
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
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
