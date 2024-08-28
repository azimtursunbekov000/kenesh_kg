import 'package:dio/dio.dart';

import 'catch_exception.dart';

class ApiRequester {
  final String url = "http://85.113.10.233:8080/api/v1/";

  Future<Dio> initDio() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
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

  Future<Response> toGet(String url, {Map<String, dynamic>? params}) async {
    Dio dio = await initDio();

    try {
      print('GET Request URL: ${this.url}$url');
      print('GET Request Params: $params');
      return dio.get(
        url,
        queryParameters: params,
      );
    } catch (e) {
      print('GET Request Error: ${e.toString()}');
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(String url, {dynamic data}) async {
    Dio dio = await initDio();

    try {
      print('POST Request URL: ${this.url}$url');
      print('POST Request Data: $data');
      return dio.post(url, data: data);
    } catch (e) {
      print('POST Request Error: ${e.toString()}');
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPut(String url, {dynamic data}) async {
    Dio dio = await initDio();

    try {
      print('PUT Request URL: ${this.url}$url');
      print('PUT Request Data: $data');
      return dio.put(url, data: data);
    } catch (e) {
      print('PUT Request Error: ${e.toString()}');
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toDelete(String url) async {
    Dio dio = await initDio();

    try {
      print('DELETE Request URL: ${this.url}$url');
      return dio.delete(url);
    } catch (e) {
      print('DELETE Request Error: ${e.toString()}');
      throw CatchException.convertException(e);
    }
  }
}
