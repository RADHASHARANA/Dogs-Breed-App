import 'package:flutter_networking/core/network_services/api_result.dart';
import '../data/dog_breeds.dart';

abstract class DogBreedsRepo {
  Future<ApiResult<DogsBreedList>> fetchDogBreedsList();
  Future<ApiResult<DogSubBreedsList>> fetchDogSubBreedsList(
      {required String brid});
  Future<ApiResult<DogDetails>> fetchDogDetails({required String subBrid});
}
