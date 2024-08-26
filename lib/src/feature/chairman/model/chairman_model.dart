import 'package:freezed_annotation/freezed_annotation.dart';

part 'chairman_model.freezed.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required int count,
    String? next,
    String? previous,
    required List<ChairmanModel> results,
  }) = _ResponseModel;
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
}
