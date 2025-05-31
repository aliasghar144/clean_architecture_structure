import 'dart:io';

import 'package:dio/dio.dart';


class DioHelper {
  static late Dio _dio;

  static Dio get dio => _dio;

  static reInitDio({required String token, String? baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? AppConstants.baseUrl,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print('Request [${options.method}] => URI: ${options.uri}');
        print('Request [${options.method}] => PATH: ${options.path}');
        print('Request [${options.method}] => headers: ${options.headers}');
        print('Request [${options.method}] => SEND DATA: ${options.data}');

        return handler.next(options);
      }, onResponse: (Response response, ResponseInterceptorHandler handler) {
        print('Response [${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response);
      }, onError: (DioException error, ErrorInterceptorHandler handler) {
        print('Error [${error.response?.statusCode}] => ERROR RESPONSE: ${error.response?.data}');
        print('Error [${error.response?.statusCode}] => ERROR message: ${error.message}');
        print('Error [${error.response?.statusCode}] => ERROR error: ${error.error}');

        String errorMessage = DioErrorHandler.handleError(
          error.response?.statusCode,
          error.response?.data is String
              ? error.response?.data
              : error.response?.data['message'] ?? error.response?.data['msg'],
        );

        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          errorMessage = 'Connection timed out. Please try again.';
        }

        print('Error [${error.response?.statusCode}] => MESSAGE: $errorMessage.');

        final modifiedError = DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          type: error.type,
          error: {
            'message': errorMessage,
            'slug': error.response?.data is Map ? error.response?.data['slug'] ?? '' : '',
          },
        );

        handler.next(modifiedError);      }),
    );
  }
}
