import 'package:flutter/material.dart';

class MainButtonWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String title;

  const MainButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<MainButtonWidget> createState() => _MainButtonWidgetState();
}

class _MainButtonWidgetState extends State<MainButtonWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isHovered ? 110 : 100,
              height: _isHovered ? 110 : 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: ColoredBox(
                  color: const Color(0xff006DCC),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Image.asset(
                      'assets/images/logoWhite.png',
                      width: _isHovered ? 110 : 100,
                      height: _isHovered ? 110 : 100,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
