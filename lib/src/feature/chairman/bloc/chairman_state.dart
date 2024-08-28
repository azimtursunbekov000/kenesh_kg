part of 'chairman_bloc.dart';

@freezed
class ChairmanState with _$ChairmanState {
  const factory ChairmanState.initial({
    required ResponseModel responseModel,
  }) = ChairmanInitialState;

  const factory ChairmanState.loadInProgress({
    required ResponseModel previousResponseModel,
  }) = ChairmanLoadInProgress;

  const factory ChairmanState.loadSuccess({
    required ResponseModel responseModel,
  }) = ChairmanLoadSuccess;

  const factory ChairmanState.loadFailure({
    required String error,
  }) = ChairmanLoadFailure;
}
