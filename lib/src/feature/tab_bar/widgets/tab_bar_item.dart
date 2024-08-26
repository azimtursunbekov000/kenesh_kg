import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final double width;
  final String text;

  const TabBarItem({
    super.key,
    required this.width,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black45),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(text),
      ),
    );
  }
}
