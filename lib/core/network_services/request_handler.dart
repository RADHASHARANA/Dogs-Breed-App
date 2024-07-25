import 'package:dio/dio.dart';
import 'package:flutter_networking/core/network_services/api_result.dart';
import 'package:flutter_networking/core/network_services/network_exception.dart';

class RequestHandler {
  RequestHandler();
  Future<ApiResult<T>> handle<T>(
      {required Future<T> Function() request}) async {
    try {
      final result = await request.call();
      return ApiResult.success(data: result);
    } on DioException catch (e) {
      final error = NetworkExceptions.fromDioError(e);
      return ApiResult.failure(error: error);
    }
  }
}
