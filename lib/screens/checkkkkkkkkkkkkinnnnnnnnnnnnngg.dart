// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';
//
// void main(){runApp(MaterialApp(home: AddVehicleScreen(),));}
// class AddVehicleScreen extends StatefulWidget {
//   @override
//   _AddVehicleScreenState createState() => _AddVehicleScreenState();
// }
//
// class _AddVehicleScreenState extends State<AddVehicleScreen> {
//   final _formKey = GlobalKey<FormState>();
//   File? _selectedFile;
// //// file poyi image pick chyn ulla code
//   Future<void> _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['png', 'jpg', 'jpeg'],
//     );
//
//     if (result != null) {
//       setState(() {
//         _selectedFile = File(result.files.single.path!);
//       });
//     }
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       print("Form Submitted!");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add Vehicle")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Add Vehicle", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 16),
//
//                 // Image Picker
//                 Row(
//                   children: [
//                     _selectedFile == null
//                         ? Container(
//                       width: 100,
//                       height: 100,
//                       color: Colors.grey[300],
//                       child: Icon(Icons.file_present, size: 50),
//                     )
//                         : Image.file(_selectedFile!, width: 100, height: 100, fit: BoxFit.cover),
//                     SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: _pickFile,
//                       child: Text("Select File"),
//                     ),
//                   ],
//                 ),
//
//                 SizedBox(height: 20),
//
//                 // Submit Button
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Text("Submit"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';
// void main(){runApp(MaterialApp(home: AddVehicleScreen(),));}
//
// class AddVehicleScreen extends StatefulWidget {
//   @override
//   _AddVehicleScreenState createState() => _AddVehicleScreenState();
// }
//
// class _AddVehicleScreenState extends State<AddVehicleScreen> {
//   final _formKey = GlobalKey<FormState>();
//   File? _selectedFile;
//
//   String? plateSource, plateCategory, registerYear;
//
//   Future<void> _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['png', 'jpg', 'jpeg'],
//     );
//
//     if (result != null) {
//       setState(() {
//         _selectedFile = File(result.files.single.path!);
//       });
//     }
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       print("Form Submitted!");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add Vehicle")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Add Vehicle", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 16),
//
//                 // Three Dropdowns in One Row
//                 Row(
//                   children: [
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         decoration: InputDecoration(labelText: "Plate Source *"),
//                         items: ["Source 1", "Source 2"].map((source) {
//                           return DropdownMenuItem(value: source, child: Text(source));
//                         }).toList(),
//                         validator: (value) => value == null ? "Required field" : null,
//                         onChanged: (value) => plateSource = value,
//                         onSaved: (value) => plateSource = value,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         decoration: InputDecoration(labelText: "Plate Category *"),
//                         items: ["Category 1", "Category 2"].map((category) {
//                           return DropdownMenuItem(value: category, child: Text(category));
//                         }).toList(),
//                         validator: (value) => value == null ? "Required field" : null,
//                         onChanged: (value) => plateCategory = value,
//                         onSaved: (value) => plateCategory = value,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         decoration: InputDecoration(labelText: "Register Year *"),
//                         items: ["2023", "2024", "2025"].map((year) {
//                           return DropdownMenuItem(value: year, child: Text(year));
//                         }).toList(),
//                         validator: (value) => value == null ? "Required field" : null,
//                         onChanged: (value) => registerYear = value,
//                         onSaved: (value) => registerYear = value,
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 SizedBox(height: 20),
//
//                 // File Picker
//                 Row(
//                   children: [
//                     _selectedFile == null
//                         ? Container(
//                       width: 100,
//                       height: 100,
//                       color: Colors.grey[300],
//                       child: Icon(Icons.file_present, size: 50),
//                     )
//                         : Image.file(_selectedFile!, width: 100, height: 100, fit: BoxFit.cover),
//                     SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: _pickFile,
//                       child: Text("Select File"),
//                     ),
//                   ],
//                 ),
//
//                 SizedBox(height: 20),
//
//                 // Submit Button
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Text("Submit"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
//
// class SearchableDropdown extends StatefulWidget {
//   final List<String> items;
//   final String hint;
//   final Function(String) onItemSelected;
//
//   const SearchableDropdown({
//     super.key,
//     required this.items,
//     required this.onItemSelected,
//     this.hint = 'Select an item', required String hintText,
//   });
//
//   @override
//   State<SearchableDropdown> createState() => _SearchableDropdownState();
// }
//
// class _SearchableDropdownState extends State<SearchableDropdown> {
//   final TextEditingController _searchController = TextEditingController();
//   final LayerLink _layerLink = LayerLink();
//   final FocusNode _focusNode = FocusNode();
//
//   bool _isDropdownOpen = false;
//   List<String> _filteredItems = [];
//   String? _selectedItem;
//   OverlayEntry? _overlayEntry;
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredItems = widget.items;
//     _searchController.addListener(_filterItems);
//     _focusNode.addListener(() {
//       if (_focusNode.hasFocus && !_isDropdownOpen) {
//         _openDropdown();
//       } else if (!_focusNode.hasFocus && _isDropdownOpen) {
//         _closeDropdown();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _closeDropdown();
//     _searchController.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   void _filterItems() {
//     final String query = _searchController.text.toLowerCase();
//     setState(() {
//       _filteredItems = widget.items
//           .where((item) => item.toLowerCase().contains(query))
//           .toList();
//     });
//     if (_isDropdownOpen) {
//       _updateOverlay();
//     }
//   }
//
//   void _openDropdown() {
//     _overlayEntry = _createOverlayEntry();
//     Overlay.of(context).insert(_overlayEntry!);
//     setState(() {
//       _isDropdownOpen = true;
//     });
//   }
//
//   void _closeDropdown() {
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//     setState(() {
//       _isDropdownOpen = false;
//     });
//   }
//
//   void _updateOverlay() {
//     _overlayEntry?.remove();
//     _overlayEntry = _createOverlayEntry();
//     Overlay.of(context).insert(_overlayEntry!);
//   }
//
//   void _selectItem(String item) {
//     setState(() {
//       _selectedItem = item;
//       _searchController.text = item;
//     });
//     widget.onItemSelected(item);
//     _closeDropdown();
//   }
//
//   OverlayEntry _createOverlayEntry() {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     final size = renderBox.size;
//
//     return OverlayEntry(
//       builder: (context) => Positioned(
//         width: size.width,
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           offset: Offset(0.0, size.height + 5),
//           child: Material(
//             elevation: 6.0,
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//             child: Container(
//               constraints: BoxConstraints(maxHeight: 250),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                   )
//                 ],
//               ),
//               child: _filteredItems.isEmpty
//                   ? const ListTile(
//                 title: Text("No items found", style: TextStyle(color: Colors.grey)),
//                 enabled: false,
//               )
//                   : ListView.builder(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 itemCount: _filteredItems.length,
//                 itemBuilder: (context, index) {
//                   final item = _filteredItems[index];
//                   return ListTile(
//                     title: Text(item),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     onTap: () => _selectItem(item),
//                     tileColor: _selectedItem == item ? Colors.grey.shade200 : null,
//                     hoverColor: Colors.blue.shade50,
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.grey.shade300),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 6,
//                   spreadRadius: 1,
//                 )
//               ],
//             ),
//             child: TextField(
//               controller: _searchController,
//               focusNode: _focusNode,
//               decoration: InputDecoration(
//                 hintText: widget.hint,
//                 prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                 suffixIcon: GestureDetector(
//                   onTap: () {
//                     if (_isDropdownOpen) {
//                       _focusNode.unfocus();
//                     } else {
//                       _focusNode.requestFocus();
//                     }
//                   },
//                   child: Icon(
//                     _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 border: InputBorder.none,
//                 contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//               ),
//               onTap: () {
//                 if (!_isDropdownOpen) {
//                   _openDropdown();
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// // Example usage:
// void main(){runApp(MaterialApp(home: MyHomePage(),));}
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Sample data
//     final List<String> countries = [
//       'United States',
//       'Canada',
//       'United Kingdom',
//       'Australia',
//       'Germany',
//       'France',
//       'Italy',
//       'Japan',
//       'China',
//       'India',
//       'Brazil',
//       'Mexico',
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Integrated Searchable Dropdown'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Select a country:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             SizedBox(width: 250,
//               child: SearchableDropdown(
//                 items: countries,
//                 hint: 'Search and select a country',
//                 onItemSelected: (item) {
//                   // Handle the selected item
//                   print('Selected: $item');
//                 }, hintText: '*****',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// } properly working


// import 'package:flutter/material.dart';
//
// class SearchableDropdown extends StatefulWidget {
//   final List<String> items;
//   final String hintText;
//   final Function(String) onItemSelected;
//
//   const SearchableDropdown({
//     super.key,
//     required this.items,
//     required this.onItemSelected,
//     this.hintText = 'Select an item',
//   });
//
//   @override
//   State<SearchableDropdown> createState() => _SearchableDropdownState();
// }
//
// class _SearchableDropdownState extends State<SearchableDropdown> {
//   final TextEditingController _searchController = TextEditingController();
//   List<String> _filteredItems = [];
//   String? _selectedItem;
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredItems = widget.items;
//     _searchController.addListener(_filterItems);
//   }
//
//   void _filterItems() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       _filteredItems = widget.items
//           .where((item) => item.toLowerCase().contains(query))
//           .toList();
//     });
//   }
//
//   void _selectItem(String item) {
//     setState(() {
//       _selectedItem = item;
//       _searchController.text = item;
//     });
//     widget.onItemSelected(item);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: widget.hintText,
//             prefixIcon: const Icon(Icons.search, color: Colors.grey),
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 10),
//         _filteredItems.isEmpty
//             ? const Text("No items found")
//             : SizedBox(
//           height: 200,
//           child: ListView.builder(
//             itemCount: _filteredItems.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(_filteredItems[index]),
//                 onTap: () => _selectItem(_filteredItems[index]),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
