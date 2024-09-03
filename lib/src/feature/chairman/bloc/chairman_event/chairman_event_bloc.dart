import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kenesh_kg/src/feature/chairman/data/data.dart';

import '../../model/model.dart';

part 'chairman_event_bloc.freezed.dart';
part 'chairman_event_event.dart';
part 'chairman_event_state.dart';

class ChairmanEventBloc extends Bloc<ChairmanEventEvent, ChairmanEventState> {
  final ChairmanEventRepository chairmanRepository;

  ChairmanEventBloc({required this.chairmanRepository})
      : super(
          ChairmanEventState.initial(
            chairmanEventModel: ChairmanEventModel(
              count: 0,
              results: [],
            ),
          ),
        ) {
    on<ChairmanEventEvent>(
      (event, emit) => event.map(
        init: (event) => _onStarted(emit),
        getAllEvents: (event) => _onGetAllEvents(emit),
      ),
    );
  }

  Future<void> _onStarted(Emitter<ChairmanEventState> emit) async {
    try {
      final responseModel = await chairmanRepository.getAllChairmanEvent();
      emit(ChairmanEventState.loadSuccess(chairmanEventModel: responseModel));
    } catch (e) {
      emit(ChairmanEventState.loadFailure(error: e.toString()));
    }
  }

  Future<void> _onGetAllEvents(Emitter<ChairmanEventState> emit) async {
    ChairmanEventModel previousResponseModel = state.maybeWhen(
      initial: (chairmanEventModel) => chairmanEventModel,
      loadInProgress: (previousResponseModel) => previousResponseModel,
      loadSuccess: (chairmanEventModel) => chairmanEventModel,
      orElse: () => const ChairmanEventModel(count: 0, results: []),
    );

    emit(ChairmanEventState.loadInProgress(
        previousResponseModel: previousResponseModel));

    try {
      final responseModel = await chairmanRepository.getAllChairmanEvent();
      emit(ChairmanEventState.loadSuccess(chairmanEventModel: responseModel));
    } catch (error) {
      emit(
        ChairmanEventState.loadFailure(
          error: error.toString(),
        ),
      );
    }
  }
}
