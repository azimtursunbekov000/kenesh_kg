part of 'chairman_event_bloc.dart';

@freezed
class ChairmanEventState with _$ChairmanEventState {
  const factory ChairmanEventState.initial({
    @Default(ChairmanEventModel(count: 0, results: []))
    ChairmanEventModel chairmanEventModel,
  }) = ChairmanEventInitialState;

  const factory ChairmanEventState.loadInProgress({
    required ChairmanEventModel previousResponseModel,
  }) = ChairmanEventLoadInProgress;

  const factory ChairmanEventState.loadSuccess({
    required ChairmanEventModel chairmanEventModel,
  }) = ChairmanEventLoadSuccess;

  const factory ChairmanEventState.loadFailure({
    required String error,
  }) = ChairmanEventLoadFailure;
}
