part of 'vice_chairman_bloc.dart';

@freezed
class ViceChairmanState with _$ViceChairmanState {
  const factory ViceChairmanState.initial({
    required ViceChairmanResponseModel responseModel,
  }) = ViceChairmanInitialState;

  const factory ViceChairmanState.loadInProgress({
    required ViceChairmanResponseModel responseModel,
  }) = ViceChairmanLoadInProgress;

  const factory ViceChairmanState.loadSuccess({
    required ViceChairmanResponseModel responseModel,
  }) = ViceChairmanLoadSuccess;

  const factory ViceChairmanState.loadFailure({
    required String error,
  }) = ViceChairmanLoadFailure;
}
