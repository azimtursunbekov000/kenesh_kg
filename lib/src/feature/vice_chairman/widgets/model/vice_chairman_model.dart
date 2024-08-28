import 'package:freezed_annotation/freezed_annotation.dart';

part 'vice_chairman_model.freezed.dart';
part 'vice_chairman_model.g.dart';

@freezed
class ViceChairmanResponseModel with _$ViceChairmanResponseModel {
  const factory ViceChairmanResponseModel({
    int? count,
    String? next,
    String? previous,
    List<ViceChairmanModel>? results,
  }) = _ViceChairmanResponseModel;

  factory ViceChairmanResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ViceChairmanResponseModelFromJson(json);
}

@freezed
class ViceChairmanModel with _$ViceChairmanModel {
  const factory ViceChairmanModel({
    int? id,
    String? full_name,
    String? photo,
    String? biographyRendered,
    String? biography,
    String? biographyKgRendered,
    String? biographyKg,
    String? job_title,
    String? job_title_kg,
  }) = _ViceChairmanModel;

  factory ViceChairmanModel.fromJson(Map<String, dynamic> json) =>
      _$ViceChairmanModelFromJson(json);
}
