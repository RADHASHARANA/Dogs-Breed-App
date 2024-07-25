import 'package:flutter/material.dart';
import 'package:flutter_networking/app_page.dart';
import 'package:flutter_networking/repository/dog_breeds-repo_impl.dart';

import 'core/network_services/api_dio_client.dart';

void main() {
  final apiClient = ApiClient();
  final dogBreedsRepo = DogBreedsRepoImpl(
    dioServices: apiClient.dogceoAPI(),
  );
  runApp(AppPage(
    dogBreedsRepo: dogBreedsRepo,
  ));
}
