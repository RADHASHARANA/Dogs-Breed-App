import 'package:flutter_networking/core/network_services/dio_service.dart';

import 'base_url.dart';

class ApiClient {
  ApiClient();

  DioServices _client({
    required String baseUrl,
    Headers? headers,
  }) {
    return DioServices(baseUrl: baseUrl, headers: headers);
  }

  DioServices dogceoAPI() {
    return _client(baseUrl: BaseUrl.dogsBreed);
  }
}
