import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kenesh_kg/src/feature/vice_chairman/widgets/data/data.dart';
import 'package:kenesh_kg/src/feature/vice_chairman/widgets/model/model.dart';

part 'vice_chairman_bloc.freezed.dart';
part 'vice_chairman_event.dart';
part 'vice_chairman_state.dart';

class ViceChairmanBloc extends Bloc<ViceChairmanEvent, ViceChairmanState> {
  final ViceChairmanRepository viceChairmanRepository;

  ViceChairmanBloc({required this.viceChairmanRepository})
      : super(
          const ViceChairmanState.initial(
            responseModel: ViceChairmanResponseModel(
              count: 0,
              results: [],
            ),
          ),
        ) {
    on<ViceChairmanEvent>(
      (event, emit) => event.map(
        init: (event) => _onChairmanInit(emit),
        getAllViceChairman: (event) => _onGetAllChairmen(emit),
      ),
    );
  }

  Future<void> _onChairmanInit(Emitter<ViceChairmanState> emit) async {
    try {
      final responseModel = await viceChairmanRepository.getAllViceChairman();
      emit(ViceChairmanState.loadSuccess(responseModel: responseModel));
    } catch (e) {
      emit(ViceChairmanState.loadFailure(error: e.toString()));
    }
  }

  Future<void> _onGetAllChairmen(Emitter<ViceChairmanState> emit) async {
    ViceChairmanResponseModel previousResponseModel = state.maybeWhen(
      initial: (responseModel) => responseModel,
      loadInProgress: (responseModel) => responseModel,
      loadSuccess: (responseModel) => responseModel,
      orElse: () => const ViceChairmanResponseModel(count: 0, results: []),
    );
    emit(
        ViceChairmanState.loadInProgress(responseModel: previousResponseModel));

    try {
      final responseModel = await viceChairmanRepository.getAllViceChairman();
      emit(ViceChairmanState.loadSuccess(responseModel: responseModel));
    } catch (e) {
      emit(ViceChairmanState.loadFailure(error: e.toString()));
    }
  }
}
