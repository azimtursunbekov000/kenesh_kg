import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kenesh_kg/src/common/common.dart';

import '../../../model/model.dart';

abstract interface class IChairmanEventDataProvider {
  Future<ChairmanEventModel> getAllChairmanEvent();
}

class ChairmanEventDataProvider implements IChairmanEventDataProvider {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<ChairmanEventModel> getAllChairmanEvent() async {
    try {
      Response response = await apiRequester.toGet('album');
      log('getAllChairmanEvent response statusCode == ${response.statusCode}');
      log('getAllChairmanEvent response data == ${response.data}');

      final responseModel = ChairmanEventModel.fromJson(response.data);

      return responseModel;
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }
}
