import 'package:freezed_annotation/freezed_annotation.dart';

part 'chairman_event_model.freezed.dart';
part 'chairman_event_model.g.dart';

@freezed
class ChairmanEventModel with _$ChairmanEventModel {
  const factory ChairmanEventModel({
    int? count,
    String? next,
    String? previous,
    List<ResultModel>? results,
  }) = _ChairmanEventModel;

  factory ChairmanEventModel.fromJson(Map<String, dynamic> json) =>
      _$ChairmanEventModelFromJson(json);
}

@freezed
class ResultModel with _$ResultModel {
  const factory ResultModel({
    int? id,
    String? title,
    String? title_kg,
    String? description,
    String? description_kg,
    List<String>? photos,
    List<VideoModel>? videos,
  }) = _ResultModel;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    int? id,
    String? video_file,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}
