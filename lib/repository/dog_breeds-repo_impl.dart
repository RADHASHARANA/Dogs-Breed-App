import 'package:flutter_networking/core/network_services/api_result.dart';
import 'package:flutter_networking/core/network_services/dio_service.dart';
import 'package:flutter_networking/data/dog_breeds_list.dart';
import 'package:flutter_networking/data/dog_details.dart';
import 'package:flutter_networking/data/dog_sub_breeds_list.dart';
import 'package:flutter_networking/repository/dog_breeds_repo.dart';

class DogBreedsRepoImpl implements DogBreedsRepo {
  DioServices _dioServices;
  DogBreedsRepoImpl({required DioServices dioServices})
      : _dioServices = dioServices;

  @override
  Future<ApiResult<DogsBreedList>> fetchDogBreedsList() {
    // TODO: implement fetchDogBreedsList
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<DogDetails>> fetchDogDetails({required String subBrid}) {
    // TODO: implement fetchDogDetails
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<DogSubBreedsList>> fetchDogSubBreedsList(
      {required String brid}) {
    // TODO: implement fetchDogSubBreedsList
    throw UnimplementedError();
  }
}
