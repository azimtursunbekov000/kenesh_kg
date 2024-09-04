import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kenesh_kg/src/feature/chairman/widgets/page/media_kit_player.dart';
import '../../bloc/bloc.dart';

class VideoGalleryDetailPage extends StatelessWidget {
  const VideoGalleryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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

            return SingleChildScrollView(
              child: Column(
                children: [
                  ...events!.map((event) {
                    if (event.videos == null || event.videos!.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return Container(
                      margin: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MediaKitPlayerWidget(
                            videoUrl: event.videos?[0].video_url ?? '',
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
                    );
                  }).toList(),
                ],
              ),
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
