import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kenesh_kg/src/common/common.dart';
import 'package:kenesh_kg/src/feature/vice_chairman/widgets/model/model.dart';

import '../bloc/bloc.dart';

class ViceChairmanPage extends StatelessWidget {
  const ViceChairmanPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building ViceChairmanPage...');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).vice_chairmen,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: BlocBuilder<ViceChairmanBloc, ViceChairmanState>(
          builder: (context, state) {
            print('Current state: $state');

            if (state is ViceChairmanLoadInProgress) {
              print('State is ViceChairmanLoadInProgress');
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ViceChairmanLoadFailure) {
              print(
                  'State is ViceChairmanLoadFailure with error: ${state.error}');
              return Center(
                child: Text('Ошибка загрузки: ${state.error}'),
              );
            }

            ViceChairmanResponseModel responseList =
                const ViceChairmanResponseModel(count: 0, results: []);

            state.maybeWhen(
              initial: (responseModel) {
                print('State is initial with responseModel: $responseModel');
                responseList = responseModel;
              },
              loadInProgress: (responseModel) {
                print(
                    'State is loadInProgress with responseModel: $responseModel');
                responseList = responseModel;
              },
              loadSuccess: (responseModel) {
                print(
                    'State is loadSuccess with responseModel: $responseModel');
                responseList = responseModel;
              },
              orElse: () {
                print('State is unhandled');
              },
            );

            print('Response list: ${responseList.results}');

            if (responseList.results!.isEmpty) {
              print('No data available to display');
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 24,
                      childAspectRatio: 0.5,
                    ),
                    itemCount: responseList.results?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Theme.of(context).drawerTheme.scrimColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  responseList.results?[index].photo ?? '',
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  responseList.results?[index].full_name ?? '',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  responseList.results?[index].job_title ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
