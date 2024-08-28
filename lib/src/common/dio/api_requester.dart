import 'package:dio/dio.dart';

import '../common.dart';

class ApiRequester {
  final String url = "http://85.113.10.233:8080/api/v1/";

  Future<Dio> initDio() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print(
              "REQUEST[${options.method}] => PATH: ${options.path} => DATA: ${options.data} => QUERY: ${options.queryParameters} => HEADERS: ${options.headers}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(
              "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print(
              "ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path} => MESSAGE: ${e.message} => DATA: ${e.response?.data}");
          return handler.next(e);
        },
      ),
    );

    return dio;
  }

  Future<Response> toGet(String endpoint,
      {Map<String, dynamic>? params}) async {
    Dio dio = await initDio();

    try {
      print('GET Request URL: ${this.url}$endpoint');
      print('GET Request Params: $params');
      return await dio.get(
        endpoint,
        queryParameters: params,
      );
    } catch (e) {
      print('GET Request Error: ${e.toString()}');
      throw CatchException.convertException(e);
    }
  }
}
