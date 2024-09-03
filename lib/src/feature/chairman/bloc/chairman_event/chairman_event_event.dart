part of 'chairman_event_bloc.dart';

@freezed
class ChairmanEventEvent with _$ChairmanEventEvent {
  const factory ChairmanEventEvent.init() = ChairmanEventInitEvent;

  const factory ChairmanEventEvent.getAllEvents() = GetAllEventsEvent;
}
