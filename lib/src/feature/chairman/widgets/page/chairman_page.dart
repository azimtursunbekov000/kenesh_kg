import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kenesh_kg/src/feature/chairman/model/chairman_model.dart';

import '../../bloc/chairman_bloc.dart';

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
        child: BlocBuilder<ChairmanBloc, ChairmanState>(
          builder: (context, state) {
            List<ChairmanModel> chairmanList = [];

            state.maybeWhen(
              initial: (chairmanModels) {
                chairmanList = chairmanModels;
              },
              loadInProgress: (chairmanModels) {
                chairmanList = chairmanModels;
              },
              loadSuccess: (chairmanModels) {
                chairmanList = chairmanModels;
              },
              loadFailure: (chairmanModels) {
                chairmanList = chairmanModels;
              },
              orElse: () {},
            );

            if (chairmanList.isEmpty) {
              return Center(child: Text('No data available'));
            }

            return Row(
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
                    Text(chairmanList[0].full_name),
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
            );
          },
        ),
      ),
    );
  }
}
