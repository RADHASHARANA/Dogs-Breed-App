import 'package:flutter_networking/core/network_services/api_result.dart';
import 'package:flutter_networking/core/network_services/dio_service.dart';
import 'package:flutter_networking/core/network_services/end_points.dart';
import 'package:flutter_networking/core/network_services/request_handler.dart';
import 'package:flutter_networking/repository/dog_breeds_repo.dart';
import '../../data/dog_breeds.dart';

class DogBreedsRepoImpl implements DogBreedsRepo {
  final DioServices _dioServices;
  final RequestHandler _requestHandler = RequestHandler();

  DogBreedsRepoImpl({required DioServices dioServices})
      : _dioServices = dioServices;

  @override
  Future<ApiResult<List<String>>> fetchDogBreedsList() {
    return _requestHandler.handle(request: () async {
      final response = await _dioServices.get(EndPoints.dogBreeds.breedList);
      final model = DogBreedsList.fromJson(response.data);
      return model.breedList;
    });
  }

  @override
  Future<ApiResult<DogImageDetails>> fetchDogImageDetails(
      {required String breed}) {
    return _requestHandler.handle(request: () async {
      final response = await _dioServices.get(EndPoints.dogBreeds.breedList);
      final model = DogImageDetails.fromJson(response.data);
      return model;
    });
  }

  @override
  Future<ApiResult<List<String>>> fetchDogSubBreedsList(
      {required String breed}) {
    return _requestHandler.handle(request: () async {
      final response = await _dioServices.get(EndPoints.dogBreeds.breedList);
      final model = DogSubBreedsList.fromJson(response.data);
      return model.message;
    });
  }
}
