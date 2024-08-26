import '../../model/model.dart';
import '../data.dart';

class ChairmanRepository {
  final IChairmanDataProvider chairmanDataProvider;

  ChairmanRepository({required this.chairmanDataProvider});

  List<ChairmanModel> getAllChairman() {
    return chairmanDataProvider.getAllChairman();
  }
}
