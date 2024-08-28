part of 'chairman_bloc.dart';

@freezed
class ChairmanEvent with _$ChairmanEvent {
  const factory ChairmanEvent.init() = ChairmanInitEvent;

  const factory ChairmanEvent.getAllChairman() = GetAllChairmanEvent;
}
