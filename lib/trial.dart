import 'package:flutter/material.dart';

class SearchDropdown<T> extends StatelessWidget {
  final List<DropdownItem<T>> items;
  final T? value;
  final Function(T?) onChanged;
  final String hint;
  final double? width;
  final double itemHeight;
  final double maxHeight;

  const SearchDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hint,
    this.width,
    this.itemHeight = 48.0,
    this.maxHeight = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          final selectedItem = items.firstWhere(
                (item) => item.value == value,
            orElse: () => DropdownItem(value: null, label: hint),
          );

          return GestureDetector(
            onTap: () {
              controller.openView();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedItem.label,
                    style: value != null
                        ? null
                        : TextStyle(color: Theme.of(context).hintColor),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller) {
          final query = controller.text.toLowerCase();
          final filteredItems = items
              .where((item) => item.label.toLowerCase().contains(query))
              .toList();

          return [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return SizedBox(
                    height: itemHeight,
                    child: ListTile(
                      title: Text(item.label),
                      selected: item.value == value,
                      onTap: () {
                        onChanged(item.value);
                        controller.closeView(item.label);
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  );
                },
              ),
            ),
          ];
        },
      ),
    );
  }
}

class DropdownItem<T> {
  final T? value;
  final String label;

  const DropdownItem({
    required this.value,
    required this.label,
  });
}