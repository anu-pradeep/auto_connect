// // Custom Searchable Dropdown Widget
// import 'package:auto_connect/api_service_classes/care_of_api.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import '../../common_custom_widgets/colors.dart';
//
// class CareOfDropdown extends StatefulWidget {
//   final String hintText;
//   final Function(String) onItemSelected;
//   final String? Function(String?)? validator;
//   // final List<String> items;
//
//   const CareOfDropdown({
//     super.key,
//     required this.hintText,
//     required this.onItemSelected,
//     this.validator,
//     // required this.items,
//   });
//
//   @override
//   State<CareOfDropdown> createState() => _CareOfDropdownState();
// }
//
// class _CareOfDropdownState extends State<CareOfDropdown> {
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   final GlobalKey _fieldKey = GlobalKey();
//   OverlayEntry? _overlayEntry;
//   // final List<String> items = ["Zia", "Imam", "Walk in"];
//   // List<String> filteredItems = [];
//   final CareOfsApi _careOfsApi = CareOfsApi();
//   List<Map<String, dynamic>> careOf = [];
//   List<Map<String, dynamic>> filteredCareOf = [];
//   String? selectedCareOf;
//   String? errorText;
//   int _currentPage = 1;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchCareOf();
//     _searchController.addListener(_filterCareOf);
//     _focusNode.addListener(() {
//       if (_focusNode.hasFocus) {
//         _showDropdown();
//       } else {
//         _hideDropdown();
//       }
//     });
//   }
//
//   Future<void> fetchCareOf() async {
//     try {
//       List<Map<String, dynamic>> fetchedData =
//           await _careOfsApi.fetchCareOfs(page: _currentPage);
//       setState(() {
//         careOf = fetchedData;
//         filteredCareOf = List.from(careOf);
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error fetching Care Ofs: $e');
//       }
//     }
//   }
//
//   void _filterCareOf() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredCareOf = careOf
//           .where((item) => item['name'].toLowerCase().contains(query))
//           .toList();
//     });
//
//     _hideDropdown();
//     if (_focusNode.hasFocus) {
//       _showDropdown();
//     }
//   }
//
//   void _selectItem(String item) {
//     setState(() {
//       _searchController.text = item;
//     });
//     _hideDropdown();
//     widget.onItemSelected(item);
//     FocusScope.of(context).unfocus();
//   }
//
//   void _addNewItem(String newItem) {
//     if (newItem.isNotEmpty) {
//       _selectItem(newItem);
//     }
//   }
//
//   void _showDropdown() {
//     _hideDropdown();
//
//     final RenderBox renderBox =
//         _fieldKey.currentContext!.findRenderObject() as RenderBox;
//     final size = renderBox.size;
//     final offset = renderBox.localToGlobal(Offset.zero);
//
//     _overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         left: offset.dx,
//         top: offset.dy + size.height,
//         width: size.width,
//         child: Material(
//           elevation: 4.0,
//           borderRadius: BorderRadius.circular(8.0),
//           child: Container(
//             constraints: const BoxConstraints(maxHeight: 200),
//             decoration: BoxDecoration(
//               color: CustomColors.whiteColor,
//               border: Border.all(color: CustomColors.borderColor),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: filteredCareOf.isEmpty
//                 ? Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text("No items found"),
//                       ),
//                       TextButton(
//                         onPressed: () => _addNewItem(_searchController.text),
//                         child: const Text("Add New Item"),
//                       ),
//                     ],
//                   )
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     padding: EdgeInsets.zero,
//                     itemCount: filteredCareOf.length,
//                     itemBuilder: (context, index) {
//                       final item = filteredCareOf[index]['name'];
//                       return ListTile(
//                         dense: true,
//                         title: Text(
//                           item,
//                           style: TextStyle(
//                             color: CustomColors.blackColor,
//                             fontSize: 15,
//                             fontFamily: 'PoppinsMedium',
//                           ),
//                         ),
//                         onTap: () => _selectItem(item),
//                       );
//                     },
//                   ),
//           ),
//         ),
//       ),
//     );
//
//     Overlay.of(context).insert(_overlayEntry!);
//   }
//
//   void _hideDropdown() {
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//   }
//
//   @override
//   void dispose() {
//     _searchController.removeListener(_filterCareOf);
//     _searchController.dispose();
//     _focusNode.dispose();
//     _hideDropdown();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       key: _fieldKey,
//       controller: _searchController,
//       focusNode: _focusNode,
//       validator: widget.validator,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         hintStyle: TextStyle(
//           color: CustomColors.textFormTextColor,
//           fontSize: 15,
//           fontFamily: 'PoppinsMedium',
//         ),
//         suffixIcon: IconButton(
//           icon: Icon(Icons.arrow_drop_down, color: CustomColors.borderColor),
//           onPressed: () {
//             if (_focusNode.hasFocus) {
//               _focusNode.unfocus();
//             } else {
//               _focusNode.requestFocus();
//             }
//           },
//         ),
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//           borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//           borderSide: BorderSide(color: CustomColors.borderColor, width: 0.5),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//           borderSide: BorderSide(color: CustomColors.borderColor, width: 2.0),
//         ),
//       ),
//     );
//   }
// }
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
    _searchController.addListener(_filterCareOf);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showDropdown();
      } else {
        _hideDropdown();
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

  void _filterCareOf() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCareOf = careOf
          .where((item) => item['name'].toLowerCase().contains(query))
          .toList();
    });
    _hideDropdown();
    if (_focusNode.hasFocus) {
      _showDropdown();
    }
    // Keep dropdown open
    // if (_focusNode.hasFocus && _overlayEntry == null) {
    //   _showDropdown();
    // }
  }

  void _selectItem(Map<String, dynamic> item) {
    setState(() {
      _searchController.text = item['name'];
    });
    _hideDropdown();
    widget.onItemSelected(item['id'].toString()); // Pass the ID instead of name
    FocusScope.of(context).unfocus();
  }
  void _showDropdown() {
    _hideDropdown();

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
                              fontFamily: 'PoppinsMedium',
                            ),
                          ),
                        )
                      :
              // ListView.builder(
              //             shrinkWrap: true,
              //             padding: EdgeInsets.zero,
              //             itemCount: filteredCareOf.length,
              //             itemBuilder: (context, index) {
              //               final item = filteredCareOf[index]['name'];
              //               return ListTile(
              //                 dense: true,
              //                 title: Text(item),
              //                 onTap: () => _selectItem(item),
              //               );
              //             },
              //           ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: filteredCareOf.length,
                itemBuilder: (context, index) {
                  final item = filteredCareOf[index];
                  return ListTile(
                    dense: true,
                    title: Text(item['name']),
                    onTap: () => _selectItem(item), // Pass the whole item
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

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCareOf);
    _searchController.dispose();
    _focusNode.dispose();
    _hideDropdown();
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
          fontFamily: 'PoppinsMedium',
        ),
        suffixIcon: IconButton(
          icon:  Icon(Icons.arrow_drop_down,color: CustomColors.borderColor),
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
