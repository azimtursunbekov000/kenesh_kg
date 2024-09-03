import 'package:flutter/material.dart';
import 'package:kenesh_kg/src/common/common.dart';

import '../../feature/chairman/widgets/row_content.dart';

class CommonSidebar extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;

  const CommonSidebar({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
  });

  @override
  State<CommonSidebar> createState() => _CommonSidebarState();
}

class _CommonSidebarState extends State<CommonSidebar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: MediaQuery.of(context).size.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/logoWhite.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).chairman,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 60),
              RowContent(
                title: widget.text1,
                isSelected: selectedIndex == 0,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                  widget.onTap1();
                },
              ),
              const SizedBox(height: 20),
              RowContent(
                title: widget.text2,
                isSelected: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  widget.onTap2();
                },
              ),
              const SizedBox(height: 20),
              RowContent(
                title: widget.text3,
                isSelected: selectedIndex == 2,
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  widget.onTap3();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
