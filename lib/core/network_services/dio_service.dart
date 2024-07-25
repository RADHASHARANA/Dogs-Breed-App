import 'package:dio/dio.dart';

typedef Headers = Map<String, dynamic> Function();

class DioServices {
  final String baseUrl;
  final Headers? headers;
  late Dio _dio;

  DioServices({required this.baseUrl, this.headers}) {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: headers?.call(),
    );
    _dio = Dio(baseOptions);
  }
  Future<Response<T>> get<T>(
    String endpoint, {
    Options? options,
  }) async {
    return await _dio.get(endpoint);
  }
}
