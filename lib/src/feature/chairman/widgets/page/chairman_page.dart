import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
          vertical: 20,
        ),
        child: BlocBuilder<ChairmanBloc, ChairmanState>(
          builder: (context, state) {
            if (state is ChairmanLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ChairmanLoadFailure) {
              return Center(
                child: Text('Ошибка загрузки: ${state.error}'),
              );
            }

            ResponseModel responseList =
                const ResponseModel(count: 0, results: []);

            state.maybeWhen(
              initial: (responseModel) {
                responseList = responseModel;
              },
              loadInProgress: (responseModel) {
                responseList = responseModel;
              },
              loadSuccess: (responseModel) {
                responseList = responseModel;
              },
              orElse: () {},
            );

            final results = responseList.results ?? [];
            final firstChairman = results.isNotEmpty ? results[0] : null;

            return SingleChildScrollView(
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column
                    Expanded(
                      flex: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              firstChairman?.photo ?? '',
                              width: 500,
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            firstChairman?.full_name ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            firstChairman?.job_title ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 50),
                    // Right Column
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            firstChairman?.biography ?? '',
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            context.push('/');
          },
          child: const Icon(
            Icons.home_filled,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
