import 'dart:developer';

import 'package:dio/dio.dart';
import 'base_network_api_services.dart';
import 'dio_client.dart';

class NetworkApiService implements BaseNetWorkApiService {
  final _dio = DioClient.instance.dio;

  ///Get Method
  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw Exception('Something Went Wrong');
    } catch (_) {
      rethrow;
    }
  }

  ///Post Method
  @override
  Future<Map<String, dynamic>> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw Exception('Something Went Wrong');
    } catch (_) {
      rethrow;
    }
  }

  ///Put Method
  @override
  Future<Map<String, dynamic>> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw Exception('Something Went Wrong');
    } catch (_) {
      rethrow;
    }
  }

  ///Patch Method
  @override
  Future<Map<String, dynamic>> patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw Exception('Something Went Wrong');
    } catch (_) {
      rethrow;
    }
  }

  ///Delete Method
  @override
  Future<dynamic> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      throw Exception('Something Went Wrong');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> postFile(
    String path, {
    data,
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: formData,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
      );
      log(response.toString());
      log(response.data.toString());
      log(response.statusMessage.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'data': response.data};
      }
      throw Exception('Something Went Wrong');
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> putFile(
    String path, {
    data,
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: formData,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'data': response.data};
      }
      throw Exception('Something Went Wrong');
    } catch (_) {
      rethrow;
    }
  }
}
