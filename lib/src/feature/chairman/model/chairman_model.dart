import 'package:freezed_annotation/freezed_annotation.dart';

part 'chairman_model.freezed.dart';
part 'chairman_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required int count,
    String? next,
    String? previous,
    required List<ChairmanModel> results,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}

@freezed
class ChairmanModel with _$ChairmanModel {
  const factory ChairmanModel({
    required int id,
    required String full_name,
    required String photo,
    required String biographyRendered,
    required String biography,
    required String biographyKgRendered,
    required String biographyKg,
    required String job_title,
    required String job_title_kg,
  }) = _ChairmanModel;

  factory ChairmanModel.fromJson(Map<String, dynamic> json) =>
      _$ChairmanModelFromJson(json);
}
