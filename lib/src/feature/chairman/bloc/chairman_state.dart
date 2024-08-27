part of 'chairman_bloc.dart';

@freezed
class ChairmanState with _$ChairmanState {
  const factory ChairmanState.initial({
    required List<ChairmanModel> chairmanModels,
  }) = ChairmanInitialState;

  const factory ChairmanState.loadInProgress({
    required List<ChairmanModel> previousChairmanModels,
  }) = ChairmanLoadInProgress;

  const factory ChairmanState.loadSuccess({
    required List<ChairmanModel> chairmanModels,
  }) = ChairmanLoadSuccess;

  const factory ChairmanState.loadFailure({
    required List<ChairmanModel> previousChairmanModels,
  }) = ChairmanLoadFailure;

  const factory ChairmanState.loadSingleSuccess({
    required ChairmanModel chairman,
  }) = ChairmanLoadSingleSuccess;

  const factory ChairmanState.loadSingleFailure({
    required String error,
  }) = ChairmanLoadSingleFailure;
}
