import 'package:flutter_networking/core/network_services/api_result.dart';
import '../data/dog_breeds.dart';

abstract class DogBreedsRepo {
  Future<ApiResult<List<String>>> fetchDogBreedsList();
  Future<ApiResult<List<String>>> fetchDogSubBreedsList(
      {required String breed});
  Future<ApiResult<DogImageDetails>> fetchDogImageDetails(
      {required String breed});
}
