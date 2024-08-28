import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kenesh_kg/src/common/common.dart';

import '../../model/model.dart';

abstract interface class IChairmanDataProvider {
  Future<ResponseModel> getAllChairman();
}

class ChairmanDataProvider implements IChairmanDataProvider {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<ResponseModel> getAllChairman() async {
    try {
      Response response = await apiRequester.toGet('speakers');
      log('getAllChairman response statusCode == ${response.statusCode}');
      log('getAllChairman response data == ${response.data}');

      final responseModel = ResponseModel.fromJson(response.data);

      return responseModel;
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }
}
