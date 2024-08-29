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
@JsonSerializable(explicitToJson: true)
class DeputyModel with _$DeputyModel {
  const factory DeputyModel({
    int? id,
    @JsonKey(name: 'full_name') String? fullName,
    String? photo,
    String? biography,
    @JsonKey(name: 'biography_kg') String? biographyKg,
    String? phone,
    String? email,
    String? facebook,
    @JsonKey(fromJson: _fromJsonCommittees, toJson: _toJsonCommittees)
    List<Committee>? committee,
    @JsonKey(fromJson: _fromJsonFactions, toJson: _toJsonFactions)
    List<Faction>? faction,
  }) = _DeputyModel;

  factory DeputyModel.fromJson(Map<String, dynamic> json) =>
      _$DeputyModelFromJson(json);
}

// Логика десериализации для Committee
List<Committee>? _fromJsonCommittees(dynamic json) {
  if (json is List) {
    return json
        .map((e) => Committee.fromJson(e as Map<String, dynamic>))
        .toList();
  } else if (json is Map<String, dynamic>) {
    return [Committee.fromJson(json)];
  }
  return null;
}

// Логика сериализации для Committee
dynamic _toJsonCommittees(List<Committee>? committees) {
  return committees?.map((e) => e.toJson()).toList();
}

// Логика десериализации для Faction
List<Faction>? _fromJsonFactions(dynamic json) {
  if (json is List) {
    return json
        .map((e) => Faction.fromJson(e as Map<String, dynamic>))
        .toList();
  } else if (json is Map<String, dynamic>) {
    return [Faction.fromJson(json)];
  }
  return null;
}

// Логика сериализации для Faction
dynamic _toJsonFactions(List<Faction>? factions) {
  return factions?.map((e) => e.toJson()).toList();
}

@freezed
@JsonSerializable(explicitToJson: true)
class Committee with _$Committee {
  const factory Committee({
    int? id,
    String? name,
    @JsonKey(name: 'name_kg') String? nameKg,
  }) = _Committee;

  factory Committee.fromJson(Map<String, dynamic> json) =>
      _$CommitteeFromJson(json);
}

@freezed
@JsonSerializable(explicitToJson: true)
class Faction with _$Faction {
  const factory Faction({
    int? id,
    String? name,
    @JsonKey(name: 'nameKg') String? nameKg,
  }) = _Faction;

  factory Faction.fromJson(Map<String, dynamic> json) =>
      _$FactionFromJson(json);
}
