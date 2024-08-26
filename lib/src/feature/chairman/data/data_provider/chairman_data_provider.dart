import '../../model/model.dart';

abstract interface class IChairmanDataProvider {
  List<ChairmanModel> getAllChairman();
}

class ChairmanDataProvider implements IChairmanDataProvider {
  @override
  List<ChairmanModel> getAllChairman() {
    // TODO: implement getAllChairman
    throw UnimplementedError();
  }
}
