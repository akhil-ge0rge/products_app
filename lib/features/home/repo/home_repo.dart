import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:products_app/core/constants/api_constants.dart';
import 'package:products_app/core/data/network/base_network_api_services.dart';
import 'package:products_app/features/home/model/product_model.dart';

import '../../../core/data/network/exceptions.dart';

class HomeRepo {
  final BaseNetWorkApiService apiService;
  HomeRepo(this.apiService);

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await apiService.get(ApiConstants.PRODUCT_API);

      final List productsJson = response['products'];

      return productsJson
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } on TypeError catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw Exception("Something Went Wrong");
    } on DioException catch (e) {
      log('🚨 SERVER ERROR RESPONSE: ${e.response?.data}');
      log('🚨 SERVER ERROR RESPONSE: ${e.response?.statusMessage}');
      var error = DioExceptions.fromDioException(e);
      throw error.errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
