import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/data.dart';
import '../model/deputy_model.dart';

part 'deputies_bloc.freezed.dart';
part 'deputies_event.dart';
part 'deputies_state.dart';

class DeputiesBloc extends Bloc<DeputiesEvent, DeputiesState> {
  final DeputiesRepository deputiesRepository;

  DeputiesBloc({required this.deputiesRepository})
      : super(
          const DeputiesState.initial(
            responseModel: DeputyListResponse(
              count: 0,
              results: [],
            ),
          ),
        ) {
    on<DeputiesEvent>(
      (event, emit) => event.map(
        init: (event) => _onInit(emit),
        getAllDeputies: (event) => _onGetAllDeputies(emit),
      ),
    );
  }

  Future<void> _onInit(Emitter<DeputiesState> emit) async {
    try {
      final responseModel = await deputiesRepository.getAllDeputies();
      emit(DeputiesState.loadSuccess(responseModel: responseModel));
    } catch (e) {
      emit(DeputiesState.loadFailure(error: e.toString()));
    }
  }

  Future<void> _onGetAllDeputies(Emitter<DeputiesState> emit) async {
    DeputyListResponse previousResponseModel = state.maybeWhen(
      initial: (responseModel) => responseModel,
      loadInProgress: (responseModel) => responseModel,
      loadSuccess: (responseModel) => responseModel,
      orElse: () => const DeputyListResponse(count: 0, results: []),
    );

    emit(DeputiesState.loadInProgress(responseModel: previousResponseModel));

    try {
      final responseModel = await deputiesRepository.getAllDeputies();
      emit(DeputiesState.loadSuccess(responseModel: responseModel));
    } catch (e) {
      emit(DeputiesState.loadFailure(error: e.toString()));
    }
  }
}
