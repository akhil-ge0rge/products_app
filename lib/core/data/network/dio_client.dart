import 'package:dio/dio.dart';

class DioClient {
  DioClient._();

  static final instance = DioClient._();

  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      headers: {'Accept': '*/*'},
    ),
  );
}
