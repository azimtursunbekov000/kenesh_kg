import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kenesh_kg/src/common/app_router/app_routes_names.dart';

import '../../bloc/bloc.dart';

class VideoGalleryPage extends StatelessWidget {
  const VideoGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ChairmanEventBloc>().add(const ChairmanEventEvent.init());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ChairmanEventBloc, ChairmanEventState>(
        builder: (context, state) {
          if (state is ChairmanEventLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ChairmanEventLoadFailure) {
            return Center(
              child: Text('Ошибка загрузки: ${state.error}'),
            );
          }

          if (state is ChairmanEventLoadSuccess) {
            final events = state.chairmanEventModel.results;

            return CustomScrollView(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final event = events?[index];
                      if (event == null) {
                        return const SizedBox.shrink();
                      }

                      return InkWell(
                        onTap: () {
                          context.pushNamed(AppRoutesNames.videoGalleryDetail);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (event.photos?.isNotEmpty ?? false)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    event.photos?[index].image ?? '',
                                    height: 430,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              const SizedBox(height: 10),
                              Text(
                                event.title ?? 'No Title',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                event.description ?? 'No Description',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: events?.length ?? 0,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: Text('Пока нет данных.'),
          );
        },
      ),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              context.pop();
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
