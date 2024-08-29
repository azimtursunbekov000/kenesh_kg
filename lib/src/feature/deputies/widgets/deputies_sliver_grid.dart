import 'package:flutter/material.dart';
import 'package:kenesh_kg/src/feature/deputies/model/deputy_model.dart';

class DeputiesSliverGrid extends StatelessWidget {
  const DeputiesSliverGrid({
    super.key,
    required this.deputiesModels,
  });

  final List<DeputyModel> deputiesModels;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final deputy = deputiesModels[index];

          return Container(
            margin: const EdgeInsets.all(14),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    deputy.photo ?? '',
                    height: 320,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  deputy.fullName ?? '',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  deputy.faction?.name ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  deputy.committee?.name ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
          );
        },
        childCount: deputiesModels.length,
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
