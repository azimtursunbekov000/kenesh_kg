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
          const ChairmanState.initial(
            chairmanModels: [],
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
    emit(
      ChairmanState.initial(
        chairmanModels: await chairmanRepository.getAllChairman(),
      ),
    );
  }

  Future<void> _onGetAllChairmen(Emitter<ChairmanState> emit) async {
    List<ChairmanModel> chairman = [];
    state.maybeWhen(
      initial: (chairmanModels) {
        chairman = chairmanModels;
      },
      loadInProgress: (chairmanModels) {
        chairman = chairmanModels;
      },
      loadSuccess: (chairmanModels) {
        chairman = chairmanModels;
      },
      loadFailure: (chairmanModels) {
        chairman = chairmanModels;
      },
      orElse: () {},
    );
    emit(ChairmanState.loadInProgress(previousChairmanModels: chairman));

    try {
      final newChairmanModels = await chairmanRepository.getAllChairman();
      emit(ChairmanState.loadSuccess(chairmanModels: newChairmanModels));
    } catch (error) {
      emit(
        ChairmanState.loadFailure(previousChairmanModels: chairman),
      );
    }
  }
}
