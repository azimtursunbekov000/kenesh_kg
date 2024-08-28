part of 'vice_chairman_bloc.dart';

@freezed
class ViceChairmanEvent with _$ViceChairmanEvent {
  const factory ViceChairmanEvent.init() = InitViceChairmanEvent;

  const factory ViceChairmanEvent.getAllViceChairman() =
      GetAllViceChairmanEvent;
}
