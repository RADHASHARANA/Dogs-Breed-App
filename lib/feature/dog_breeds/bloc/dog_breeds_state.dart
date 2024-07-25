import 'package:equatable/equatable.dart';

import '../../common_widgets/status_handler.dart';

class DogBreedsState extends Equatable {
  Status dogBreedsListStatus;
  Status dogSubBreedsListStatus;
  Status dogImageStatus;
  Map<String, List<String>> groupedBreeds;
  String? breedListerror;
  List<String> dogSubBreedsList;
  String breedImageUrl;
  String? subbreedListerror;
  DogBreedsState({
    required this.dogBreedsListStatus,
    required this.dogImageStatus,
    required this.groupedBreeds,
    required this.breedListerror,
    required this.dogSubBreedsListStatus,
    required this.dogSubBreedsList,
    required this.breedImageUrl,
    required this.subbreedListerror,
  });

  factory DogBreedsState.initial() {
    return DogBreedsState(
      dogImageStatus: Status.initial,
      breedImageUrl: '',
      dogBreedsListStatus: Status.initial,
      groupedBreeds: {},
      breedListerror: '',
      dogSubBreedsListStatus: Status.initial,
      dogSubBreedsList: [],
      subbreedListerror: '',
    );
  }
  DogBreedsState copyWith({
    Status? dogBreedsListStatus,
    Map<String, List<String>>? groupedBreeds,
    String? breedListerror,
    Status? dogSubBreedsListStatus,
    List<String>? dogSubBreedsList,
    String? breedImageUrl,
    String? subbreedListerror,
    Status? dogImageStatus,
  }) {
    return DogBreedsState(
        dogBreedsListStatus: dogBreedsListStatus ?? this.dogBreedsListStatus,
        dogImageStatus: dogImageStatus ?? this.dogImageStatus,
        groupedBreeds: groupedBreeds ?? this.groupedBreeds,
        breedListerror: breedListerror ?? this.breedListerror,
        dogSubBreedsListStatus:
            dogSubBreedsListStatus ?? this.dogSubBreedsListStatus,
        dogSubBreedsList: dogSubBreedsList ?? this.dogSubBreedsList,
        breedImageUrl: breedImageUrl ?? this.breedImageUrl,
        subbreedListerror: subbreedListerror ?? this.subbreedListerror);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        dogBreedsListStatus,
        dogSubBreedsListStatus,
        dogImageStatus,
        groupedBreeds,
        breedListerror,
        dogSubBreedsList,
        breedImageUrl,
        subbreedListerror,
      ];
}
