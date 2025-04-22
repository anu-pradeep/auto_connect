// import 'package:flutter/material.dart';
//
// class CustomSearchableDropdown extends StatefulWidget {
//   @override
//   _CustomSearchableDropdownState createState() => _CustomSearchableDropdownState();
// }
//
// class _CustomSearchableDropdownState extends State<CustomSearchableDropdown> {
//   String? _selectedItem; // To store the selected value
//   final List<String> _items = [ // List of items
//     "Apple",
//     "Banana",
//     "Orange",
//     "Mango",
//     "Grapes",
//     "Pineapple",
//     "Strawberry",
//     "Watermelon",
//   ];
//   List<String> _filteredItems = []; // Filtered list based on search
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredItems = _items; // Initialize with all items
//   }
//
//   void _filterItems(String query) {
//     setState(() {
//       _filteredItems = _items
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
//
//   Future<void> _showSearchDialog() async {
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Search and Select"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search...",
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: _filterItems,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: _filteredItems.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(_filteredItems[index]),
//                       onTap: () {
//                         setState(() {
//                           _selectedItem = _filteredItems[index]; // Update selected item
//                         });
//                         Navigator.pop(context); // Close the dialog
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Custom Searchable Dropdown"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             InkWell(
//               onTap: _showSearchDialog, // Open the search dialog
//               child: InputDecorator(
//                 decoration: InputDecoration(
//                   labelText: "Select an item",
//                   border: OutlineInputBorder(),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(_selectedItem ?? "Select an item"),
//                     Icon(Icons.arrow_drop_down),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _selectedItem != null ? "Selected: $_selectedItem" : "No item selected",
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// void main(){runApp(MaterialApp(home: CustomSearchableDropdown(),));}
////deepseek
import 'package:flutter/material.dart';
import 'package:flutter_searchable_dropdown/flutter_searchable_dropdown.dart';

import 'add_enquiry_screen/insurance_dropdown.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Searchable Dropdown Example')),
        body: Center(
          child: SearchableDropdownExample(),
          // child: InsuranceDropdownField(firmId: 3, hintText: 'insurance',),
        ),
      ),
    );
  }
}

class SearchableDropdownExample extends StatefulWidget {
  @override
  _SearchableDropdownExampleState createState() => _SearchableDropdownExampleState();
}

class _SearchableDropdownExampleState extends State<SearchableDropdownExample> {
   String? selectedCustomer;
  List<String> customers = [
    'SANOJ',
    'ALMOND INTERIOR DECORATION L.L.C',
    'MEERAN',
    'MANOHAR',
    'LAILAS RESTAURANT',
    'SALIK'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(width: 300,
        child: SearchableDropdown.single(

           items: customers.map((String customer) {
            return DropdownMenuItem<String>(
              value: customer,
              child: Text(customer,),
            );
          }).toList(),
          value: selectedCustomer,
          hint: "Select Customer",
          searchHint: "Search for a customer",
          onChanged: (value) {
            setState(() {
              selectedCustomer = value;
            });
          },
          isExpanded: true,
          dialogBox: false,menuConstraints: const BoxConstraints(
          maxHeight: 250,
          minWidth: 280,

        ),
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
