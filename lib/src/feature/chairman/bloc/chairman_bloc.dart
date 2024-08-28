import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kenesh_kg/src/feature/chairman/data/data.dart';

import '../model/model.dart';

part 'chairman_bloc.freezed.dart';
part 'chairman_event.dart';
part 'chairman_state.dart';

class ChairmanBloc extends Bloc<ChairmanEvent, ChairmanState> {
  final ChairmanRepository chairmanRepository;

  ChairmanBloc({required this.chairmanRepository})
      : super(
          ChairmanState.initial(
            responseModel: ResponseModel(count: 0, results: []),
          ),
        ) {
    on<ChairmanEvent>(
      (event, emit) => event.map(
        init: (event) => _onChairmanInit(emit),
        getAllChairman: (event) => _onGetAllChairmen(emit),
      ),
    );
  }

  Future<void> _onChairmanInit(Emitter<ChairmanState> emit) async {
    try {
      final responseModel = await chairmanRepository.getAllChairman();
      emit(ChairmanState.loadSuccess(responseModel: responseModel));
    } catch (e) {
      emit(ChairmanState.loadFailure(error: e.toString()));
    }
  }

  Future<void> _onGetAllChairmen(Emitter<ChairmanState> emit) async {
    ResponseModel previousResponseModel = state.maybeWhen(
      initial: (responseModel) => responseModel,
      loadInProgress: (responseModel) => responseModel,
      loadSuccess: (responseModel) => responseModel,
      orElse: () => const ResponseModel(count: 0, results: []),
    );

    emit(ChairmanState.loadInProgress(
        previousResponseModel: previousResponseModel));

    try {
      final responseModel = await chairmanRepository.getAllChairman();
      emit(ChairmanState.loadSuccess(responseModel: responseModel));
    } catch (error) {
      emit(
        ChairmanState.loadFailure(
          error: error.toString(),
        ),
      );
    }
  }
}
