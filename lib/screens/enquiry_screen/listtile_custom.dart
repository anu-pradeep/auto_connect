import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final Icon icons;
  final String tittle;
  final String label;
  const CustomListTile({super.key, required this.icons, required this.tittle, required this.label});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.icons,
      title: Text(widget.tittle),
      trailing: Text(widget.label),
    );
  }
}
