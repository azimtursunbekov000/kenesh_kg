import 'package:freezed_annotation/freezed_annotation.dart';

part 'chairman_model.freezed.dart';
part 'chairman_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    int? count,
    String? next,
    String? previous,
    List<ChairmanModel>? results,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}

@freezed
class ChairmanModel with _$ChairmanModel {
  const factory ChairmanModel({
    int? id,
    String? full_name,
    String? photo,
    String? biographyRendered,
    String? biography,
    String? biographyKgRendered,
    String? biography_kg,
    String? job_title,
    String? job_title_kg,
  }) = _ChairmanModel;

  factory ChairmanModel.fromJson(Map<String, dynamic> json) =>
      _$ChairmanModelFromJson(json);
}
