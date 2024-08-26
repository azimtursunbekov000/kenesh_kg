import 'package:flutter/material.dart';
import 'package:kenesh_kg/src/common/common.dart';

class ViceChairmanPage extends StatelessWidget {
  const ViceChairmanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).vice_chairmen,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 24,
                  childAspectRatio: 2,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.green,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
