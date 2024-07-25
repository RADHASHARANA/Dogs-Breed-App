import '../../common_widgets/status_handler.dart';

abstract class DogBreedsState {}

class DogBreedsListInitial extends DogBreedsState {}

class DogBreedsListState extends DogBreedsState {
  DogBreedsListState({
    this.dogBreedsListStatus = Status.initial,
    this.groupedBreeds = const <String, List<String>>{},
    this.error,
  });
  Status dogBreedsListStatus;
  Map<String, List<String>> groupedBreeds;
  String? error;
  factory DogBreedsListState.initial() {
    return DogBreedsListState();
  }

  DogBreedsListState copyWith({
    Status? dogBreedsListStatus,
    Map<String, List<String>>? groupedBreeds,
    String? error,
  }) {
    return DogBreedsListState(
      dogBreedsListStatus: dogBreedsListStatus ?? this.dogBreedsListStatus,
      groupedBreeds: groupedBreeds ?? this.groupedBreeds,
      error: error ?? this.error,
    );
  }
}

class DogBreedDetailsState extends DogBreedsState {
  DogBreedDetailsState({
    this.dogSubBreedsListStatus = Status.initial,
    this.dogSubBreedsList = const [],
    this.breedImageUrl = '',
    this.error,
  });
  Status dogSubBreedsListStatus;
  List<String> dogSubBreedsList;
  String breedImageUrl;
  String? error;
}
