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
  }) = _DeputyModel;

  factory DeputyModel.fromJson(Map<String, dynamic> json) =>
      _$DeputyModelFromJson(json);
}

@freezed
class Committee with _$Committee {
  const factory Committee({
    int? id,
    String? name,
    String? nameKg,
  }) = _Committee;

  factory Committee.fromJson(Map<String, dynamic> json) =>
      _$CommitteeFromJson(json);
}

@freezed
class Faction with _$Faction {
  const factory Faction({
    int? id,
    String? name,
    String? nameKg,
  }) = _Faction;

  factory Faction.fromJson(Map<String, dynamic> json) =>
      _$FactionFromJson(json);
}
