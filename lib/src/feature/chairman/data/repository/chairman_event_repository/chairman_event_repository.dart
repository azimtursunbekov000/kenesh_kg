import 'package:kenesh_kg/src/feature/chairman/data/data.dart';

import '../../../model/model.dart';

class ChairmanEventRepository {
  final IChairmanEventDataProvider chairmanEventDataProvider;

  ChairmanEventRepository({required this.chairmanEventDataProvider});

  Future<ChairmanEventModel> getAllChairmanEvent() {
    return chairmanEventDataProvider.getAllChairmanEvent();
  }
}
