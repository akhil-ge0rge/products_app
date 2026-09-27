import 'dart:developer';

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String errorMessage;

  DioExceptions.fromDioException(DioException dioException) {
    log('Dio Exception Status Code :: ${dioException.response?.statusCode}');
    log('Dio Exception Message :: ${dioException.message}');
    switch (dioException.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioException);
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'No Internet.';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Unexpected error occurred.';
        break;
      default:
        errorMessage = 'Something Went Wrong';
        break;
    }
  }
  String _handleStatusCode(DioException exception) {
    final data = exception.response?.data;
    String? msg;

    if (data is Map<String, dynamic>) {
      msg = data['message'];
    } else if (data is String) {
      msg = 'Internal server error.';
    }

    final statusCode = exception.response?.statusCode;
    switch (statusCode) {
      case 400:
        return msg ?? 'User already exist';
      case 401:
        return msg ?? 'Authentication failed.';
      case 403:
        return msg ??
            'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return msg ?? 'The requested resource does not exist.';
      case 500:
        return msg ?? 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => errorMessage;
}
