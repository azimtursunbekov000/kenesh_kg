import 'package:flutter/material.dart';

class DropdownTabItem extends StatelessWidget {
  final double maxWidth;
  final String hintText;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final String? initialSelection;
  final Function(String?)? onSelected;

  const DropdownTabItem({
    Key? key,
    required this.maxWidth,
    required this.hintText,
    required this.dropdownMenuEntries,
    this.initialSelection,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: DropdownMenu<String>(
          enableSearch: false,
          enableFilter: false,
          expandedInsets: EdgeInsets.zero,
          hintText: hintText,
          initialSelection: initialSelection,
          onSelected: onSelected,
          dropdownMenuEntries: dropdownMenuEntries,
        ),
      ),
    );
  }
}
