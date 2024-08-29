import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const MainButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: ColoredBox(
                color: Color(0xff0000FF),
                child: SvgPicture.asset(
                  'assets/images/logo_of_the_jogorku_kenesh.svg',
                ),
              ),
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
