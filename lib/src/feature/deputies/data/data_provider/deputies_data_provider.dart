import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../common/common.dart';
import '../../model/deputy_model.dart';

abstract interface class IDeputiesDataProvider {
  Future<DeputyListResponse> getAllDeputies();
}

class DeputiesDataProvider implements IDeputiesDataProvider {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<DeputyListResponse> getAllDeputies() async {
    try {
      Response response = await apiRequester.toGet('deputies');
      log('getAllViceChairman response statusCode == ${response.statusCode}');
      log('getAllViceChairman response data == ${response.data}');

      final responseModel = DeputyListResponse.fromJson(response.data);
      return responseModel;
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }
}
