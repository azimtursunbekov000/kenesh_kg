import 'package:freezed_annotation/freezed_annotation.dart';

part 'deputy_model.freezed.dart';
part 'deputy_model.g.dart';

@freezed
class DeputyListResponse with _$DeputyListResponse {
  const factory DeputyListResponse({
    int? count,
    String? next,
    String? previous,
    List<DeputyModel>? results,
  }) = _DeputyListResponse;

  factory DeputyListResponse.fromJson(Map<String, dynamic> json) =>
      _$DeputyListResponseFromJson(json);
}

@freezed
class DeputyModel with _$DeputyModel {
  const factory DeputyModel({
    int? id,
    String? fullName,
    String? photo,
    String? biography,
    String? biographyKg,
    String? phone,
    String? email,
    String? facebook,
    int? committee,
    int? faction,
  }) = _DeputyModel;

  factory DeputyModel.fromJson(Map<String, dynamic> json) =>
      _$DeputyModelFromJson(json);
}
