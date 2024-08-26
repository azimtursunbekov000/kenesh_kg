import 'package:flutter/material.dart';

class ChairmanPage extends StatelessWidget {
  const ChairmanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                SizedBox(height: 10),
                Text('ФИО'),
                SizedBox(height: 20),
                Text('Пост'),
              ],
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text('Информация о нем'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
