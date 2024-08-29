part of 'deputies_bloc.dart';

@freezed
class DeputiesState with _$DeputiesState {
  const factory DeputiesState.initial({
    required DeputyListResponse responseModel,
  }) = DeputiesInitialState;

  const factory DeputiesState.loadInProgress({
    required DeputyListResponse responseModel,
  }) = DeputiesLoadInProgress;

  const factory DeputiesState.loadSuccess({
    required DeputyListResponse responseModel,
  }) = DeputiesLoadSuccess;

  const factory DeputiesState.loadFailure({
    required String error,
  }) = DeputiesLoadFailure;
}
