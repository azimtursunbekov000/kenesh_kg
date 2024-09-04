import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MediaKitPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const MediaKitPlayerWidget({required this.videoUrl, super.key});

  @override
  _MediaKitPlayerWidgetState createState() => _MediaKitPlayerWidgetState();
}

class _MediaKitPlayerWidgetState extends State<MediaKitPlayerWidget> {
  late final Player _player;
  late final VideoController _controller;
  late final Media _media;

  @override
  void initState() {
    super.initState();

    _player = Player();
    _controller = VideoController(_player);
    _media = Media(widget.videoUrl);

    // Open the media and handle errors
    _player.open(_media).then((_) {
      print('Медиа успешно открыто');
    }).catchError((error) {
      print('Ошибка при открытии медиа: $error');
    });

    // Listen for player state changes
  }

  @override
  void dispose() {
    print('Очистка ресурсов Player');
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
        child: Video(controller: _controller),
      ),
    );
  }
}
