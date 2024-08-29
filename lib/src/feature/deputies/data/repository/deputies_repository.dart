import '../../model/deputy_model.dart';
import '../data.dart';

class DeputiesRepository {
  final IDeputiesDataProvider viceChairmanDataProvider;

  DeputiesRepository({required this.viceChairmanDataProvider});

  Future<DeputyListResponse> getAllDeputies() {
    return viceChairmanDataProvider.getAllDeputies();
  }
}
