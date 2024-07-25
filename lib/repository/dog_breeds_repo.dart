import 'package:flutter_networking/core/network_services/api_result.dart';
import '../data/dog_breeds.dart';

abstract class DogBreedsRepo {
  Future<ApiResult<Map<String, List<String>>>> fetchDogBreedsList();
  Future<ApiResult<List<String>>> fetchDogSubBreedsList(
      {required String breedName});
  Future<ApiResult<DogImageDetails>> fetchDogImageDetails(
      {required String breedName});
}
