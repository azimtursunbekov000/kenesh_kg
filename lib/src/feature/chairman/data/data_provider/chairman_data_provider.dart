import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kenesh_kg/src/common/common.dart';

import '../../model/model.dart';

abstract interface class IChairmanDataProvider {
  Future<List<ChairmanModel>> getAllChairman();
}

class ChairmanDataProvider implements IChairmanDataProvider {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<List<ChairmanModel>> getAllChairman() async {
    try {
      Response response = await apiRequester.toGet('speakers');
      log('getAllChairman response statusCode == ${response.statusCode}');
      log('getAllChairman response data == ${response.data}');

      final responseModel = ResponseModel.fromJson(response.data);

      return responseModel.results;
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }
}
