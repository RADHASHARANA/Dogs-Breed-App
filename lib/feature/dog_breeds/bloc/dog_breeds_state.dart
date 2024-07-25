enum Status {
  initial,
  loading,
  success,
  error,
}

abstract class DogBreedsState {}

class DobBreedsListInitial extends DogBreedsState {}

class DobBreedsListState extends DogBreedsState {
  DobBreedsListState({
    this.dogBreedsListStatus = Status.initial,
    this.dogBreedsList = const [],
    this.error,
  });
  Status dogBreedsListStatus;
  List<String> dogBreedsList;
  String? error;
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
