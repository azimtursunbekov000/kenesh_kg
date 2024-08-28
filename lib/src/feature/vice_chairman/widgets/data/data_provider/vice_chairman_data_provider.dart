import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kenesh_kg/src/common/common.dart';

import '../../model/model.dart';

abstract interface class IViceChairmanDataProvider {
  Future<ViceChairmanResponseModel> getAllViceChairman();
}

class ViceChairmanDataProvider implements IViceChairmanDataProvider {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<ViceChairmanResponseModel> getAllViceChairman() async {
    try {
      Response response = await apiRequester.toGet('speakers/deputies');
      log('getAllViceChairman response statusCode == ${response.statusCode}');
      log('getAllViceChairman response data == ${response.data}');

      final responseModel = ViceChairmanResponseModel.fromJson(response.data);
      return responseModel;
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }
}
