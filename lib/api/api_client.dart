import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  ApiClient({required this.baseUrl}) : assert(baseUrl != null) {
    dio = Dio()
      ..options.baseUrl = baseUrl!
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onResponse: (response, handler) => handler.next(response),
        onError: (DioError e, handler) => handler.next(e),
      ));
    if (!kReleaseMode) {
      dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
      ));
    }
  }

  final String? baseUrl;
  Dio? dio;
}
