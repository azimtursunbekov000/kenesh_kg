part of 'deputies_bloc.dart';

@freezed
class DeputiesEvent with _$DeputiesEvent {
  const factory DeputiesEvent.init() = DeputiesInitEvent;

  const factory DeputiesEvent.getAllDeputies() = GetAllDeputiesEvent;
}
