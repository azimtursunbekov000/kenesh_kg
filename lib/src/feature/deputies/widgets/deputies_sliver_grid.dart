import 'package:flutter/material.dart';

class DeputiesSliverGrid extends StatelessWidget {
  const DeputiesSliverGrid({
    super.key,
    required this.deputiesModel,
  });

  final DeputiesModel deputiesModel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(14),
            child: Column(
              children: [
                Image.asset(
                  deputiesModel.pathToImage,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  deputiesModel.fullName,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Депутатская группа "Мекенчил"',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
        childCount: 20,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
        crossAxisCount: 4,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
    );
  }
}
