import '../../model/model.dart';
import '../data.dart';

class ChairmanRepository {
  final IChairmanDataProvider chairmanDataProvider;

  ChairmanRepository({required this.chairmanDataProvider});

  Future<ResponseModel> getAllChairman() {
    return chairmanDataProvider.getAllChairman();
  }
}
