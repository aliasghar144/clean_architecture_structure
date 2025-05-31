import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


Future<Either<ErrorModel, T>> safeApiCall<T>(
    Future<T> Function() apiCall, {
      bool showToast = true,
    }) async {
  try {
    final result = await apiCall();
    return Right(result);
  } catch (e) {
    if (e is DioException) {
      print('################### ERROR : $e');

      if (e.error is SocketException ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        final completer = Completer<Either<ErrorModel, T>>();
        ToastManager.persistentInternetError(() async {
          print('Retrying API call');
          final retryResult = await safeApiCall(apiCall, showToast: showToast);
          completer.complete(retryResult);
        });
        return await completer.future;
      }

      final data = e.response?.data;
      print('Data runtime type: ${data.runtimeType}');

      if (e.error is Map<String, dynamic>) {
        final errorData = e.error as Map<String, dynamic>;
        final message = errorData['message']?.toString() ?? 'خطای ناشناخته';
        final slug = errorData['slug']?.toString() ?? '';
        if (showToast) ToastManager.error(message);
        return Left(ErrorModel(message, slug));
      }

      if (data is Map<String, dynamic>) {
        final message = data['message']?.toString() ?? data['msg']?.toString() ?? 'خطای ناشناخته';
        final slug = data['slug']?.toString() ?? '';
        if (showToast) ToastManager.error(message);
        return Left(ErrorModel(message, slug));
      }

      if (data is String) {
        if (showToast) ToastManager.error(data);
        return Left(ErrorModel(data, ''));
      }

      if (data == null) {
        final message = 'پاسخی از سرور دریافت نشد';
        if (showToast) ToastManager.error(message);
        return Left(ErrorModel(message, ''));
      }
    }
    if (showToast) {
      ToastManager.error('یک خطای ناشناخته به وجود آمده است');
    }
    return Left(ErrorModel('یک خطای ناشناخته به وجود آمده است', ''));
  }
}
