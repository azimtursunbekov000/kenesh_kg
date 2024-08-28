import 'package:kenesh_kg/src/feature/vice_chairman/widgets/data/data.dart';
import 'package:kenesh_kg/src/feature/vice_chairman/widgets/model/model.dart';

class ViceChairmanRepository {
  final IViceChairmanDataProvider viceChairmanDataProvider;

  ViceChairmanRepository({required this.viceChairmanDataProvider});

  Future<ViceChairmanResponseModel> getAllViceChairman() {
    return viceChairmanDataProvider.getAllViceChairman();
  }
}
