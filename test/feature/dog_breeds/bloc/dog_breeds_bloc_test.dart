import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_networking/core/network_services/api_result.dart';
import 'package:flutter_networking/data/dog_details.dart';
import 'package:flutter_networking/feature/common_widgets/status_handler.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_bloc.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_state.dart';
import 'package:flutter_networking/repository/dog_breeds_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDogBreedsRepo extends Mock implements DogBreedsRepo {}

void main() {
  MockDogBreedsRepo mockDogBreedsRepo = MockDogBreedsRepo();
  late DogBreedsCubit dogBreedsCubit;
  late DogBreedsState dogBreedsState;

  setUp(() {
    dogBreedsCubit = DogBreedsCubit(dogBreedsRepo: mockDogBreedsRepo);
    dogBreedsState = DogBreedsState.initial();
  });
  group('FetchDogBreeds', () {
    const breedList = {
      'hound': ['afghan hound', 'basset hound'],
      'spaniel': ['breton', 'clumber spaniel'],
    };
    blocTest(
      'FetchDogBreeds with success',
      build: () => dogBreedsCubit,
      setUp: () {
        when(() => mockDogBreedsRepo.fetchDogBreedsList())
            .thenAnswer((_) async => const ApiResult.success(data: breedList));
      },
      act: (cubit) {
        cubit.fetchDogBreeds();
      },
      expect: () => [
        dogBreedsState.copyWith(dogBreedsListStatus: Status.loading),
        dogBreedsState.copyWith(
            dogBreedsListStatus: Status.success, groupedBreeds: breedList),
      ],
    );
    blocTest(
      'FetchDogBreeds with No records',
      build: () => dogBreedsCubit,
      setUp: () {
        when(() => mockDogBreedsRepo.fetchDogBreedsList())
            .thenAnswer((_) async => const ApiResult.success(data: {}));
      },
      act: (cubit) {
        cubit.fetchDogBreeds();
      },
      expect: () => [
        dogBreedsState.copyWith(dogBreedsListStatus: Status.loading),
        dogBreedsState.copyWith(dogBreedsListStatus: Status.empty),
      ],
    );

    blocTest(
      'FetchDogBreeds with error',
      build: () => dogBreedsCubit,
      setUp: () {
        when(() => mockDogBreedsRepo.fetchDogBreedsList())
            .thenAnswer((_) async => ApiResult.error('Error'));
      },
      act: (cubit) {
        cubit.fetchDogBreeds();
      },
      expect: () => [
        dogBreedsState.copyWith(dogBreedsListStatus: Status.loading),
        dogBreedsState.copyWith(
            dogBreedsListStatus: Status.error,
            breedListerror: DioException(
                    error: 'Error', requestOptions: RequestOptions(path: ''))
                .toString()),
      ],
    );
  });
  group('FetchDogSubBreeds', () {
    const subBreeds = ['afghan hound', 'basset hound'];
    blocTest(
      'FetchDogSubBreeds with success',
      build: () => dogBreedsCubit,
      setUp: () {
        when(() => mockDogBreedsRepo.fetchDogSubBreedsList(breedName: 'hound'))
            .thenAnswer((_) async => const ApiResult.success(data: subBreeds));
      },
      act: (cubit) {
        cubit.fetchDogSubBreeds('hound');
      },
      expect: () => [
        dogBreedsState.copyWith(dogSubBreedsListStatus: Status.loading),
        dogBreedsState.copyWith(
            dogSubBreedsListStatus: Status.success,
            dogSubBreedsList: subBreeds),
      ],
    );
    blocTest(
      'FetchDogSubBreeds with No records',
      build: () => dogBreedsCubit,
      setUp: () {
        when(() => mockDogBreedsRepo.fetchDogSubBreedsList(breedName: 'hound'))
            .thenAnswer((_) async => const ApiResult.success(data: []));
      },
      act: (cubit) {
        cubit.fetchDogSubBreeds('hound');
      },
      expect: () => [
        dogBreedsState.copyWith(dogSubBreedsListStatus: Status.loading),
        dogBreedsState.copyWith(dogSubBreedsListStatus: Status.empty),
      ],
    );

    blocTest(
      'FetchDogSubBreeds with error',
      build: () => dogBreedsCubit,
      setUp: () {
        when(() => mockDogBreedsRepo.fetchDogSubBreedsList(breedName: 'hound'))
            .thenAnswer((_) async => ApiResult.error('Error'));
      },
      act: (cubit) {
        cubit.fetchDogSubBreeds('hound');
      },
      expect: () => [
        dogBreedsState.copyWith(dogSubBreedsListStatus: Status.loading),
        dogBreedsState.copyWith(
            dogSubBreedsListStatus: Status.error,
            subbreedListerror: DioException(
                    error: 'Error', requestOptions: RequestOptions(path: ''))
                .toString()),
      ],
    );
  });

  group('FetchDogImageDetails', () {
    const imageUrl = 'https://example.com/image.jpg';
    blocTest(
      'FetchDogImageDetails with success',
      build: () => dogBreedsCubit,
      setUp: () {
        when(() => mockDogBreedsRepo.fetchDogImageDetails(breedName: 'hound'))
            .thenAnswer((_) async => ApiResult.success(
                data: DogImageDetails(message: imageUrl, status: 'success')));
      },
      act: (cubit) {
        cubit.fetchDogImageDetails('hound');
      },
      expect: () => [
        dogBreedsState.copyWith(dogImageStatus: Status.loading),
        dogBreedsState.copyWith(
            dogImageStatus: Status.success, breedImageUrl: imageUrl),
      ],
    );
    blocTest(
      'FetchDogImageDetails with error',
      build: () => dogBreedsCubit,
      setUp: () {
        when(() => mockDogBreedsRepo.fetchDogImageDetails(breedName: 'hound'))
            .thenAnswer((_) async => ApiResult.error('Error'));
      },
      act: (cubit) {
        cubit.fetchDogImageDetails('hound');
      },
      expect: () => [
        dogBreedsState.copyWith(dogImageStatus: Status.loading),
        dogBreedsState.copyWith(
            dogImageStatus: Status.error,
            subbreedListerror: DioException(
                    error: 'Error', requestOptions: RequestOptions(path: ''))
                .toString()),
      ],
    );
  });
}
