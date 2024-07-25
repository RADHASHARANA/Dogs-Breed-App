import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_networking/core/network_services/network_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const ApiResult._();

  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required DioException error}) = Failure<T>;

  factory ApiResult.error(String error) => ApiResult.failure(
      error:
          DioException(error: error, requestOptions: RequestOptions(path: '')));

  bool get isSuccess => map(
        success: (_) => true,
        failure: (_) => false,
      );

  T get data => map(
        success: (data) => data.data,
        failure: (data) => throw data.error,
      );

  DioException get error => map(
        success: (_) => throw Exception('No error'),
        failure: (data) => data.error,
      );
}
