import 'package:freezed_annotation/freezed_annotation.dart';

part 'vice_chairman_model.freezed.dart';
part 'vice_chairman_model.g.dart';

@freezed
class ViceChairmanResponseModel with _$ViceChairmanResponseModel {
  const factory ViceChairmanResponseModel({
    required int count,
    String? next,
    String? previous,
    required List<ViceChairmanModel> results,
  }) = _ViceChairmanResponseModel;

  factory ViceChairmanResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ViceChairmanResponseModelFromJson(json);
}

@freezed
class ViceChairmanModel with _$ViceChairmanModel {
  const factory ViceChairmanModel({
    required int id,
    required String full_name,
    required String photo,
    required String biographyRendered,
    required String biography,
    required String biographyKgRendered,
    required String biographyKg,
    required String jobTitle,
    required String jobTitleKg,
  }) = _ViceChairmanModel;

  factory ViceChairmanModel.fromJson(Map<String, dynamic> json) =>
      _$ViceChairmanModelFromJson(json);
}
