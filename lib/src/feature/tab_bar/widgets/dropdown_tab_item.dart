import 'package:flutter/material.dart';

class DropdownTabItem extends StatelessWidget {
  final double maxWidth;
  final String hintText;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final String? initialSelection;
  final Function(String?)? onSelected;

  const DropdownTabItem({
    super.key,
    required this.maxWidth,
    required this.hintText,
    required this.dropdownMenuEntries,
    this.initialSelection,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: DropdownMenu<String>(
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
