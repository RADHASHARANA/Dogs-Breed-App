import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_state.dart';
import 'package:flutter_networking/repository/dog_breeds_repo.dart';
import '../../common_widgets/status_handler.dart';

class DogBreedsCubit extends Cubit<DogBreedsState> {
  DogBreedsCubit({required this.dogBreedsRepo})
      : super(DogBreedsState.initial()); // Initial state is an empty list
  final DogBreedsRepo dogBreedsRepo;

  void fetchDogBreeds() async {
    emit(state.copyWith(dogBreedsListStatus: Status.loading));
    final result = await dogBreedsRepo.fetchDogBreedsList();
    if (result.isSuccess) {
      if (result.data.isEmpty) {
        emit(
          state.copyWith(
            dogBreedsListStatus: Status.empty,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          dogBreedsListStatus: Status.success,
          groupedBreeds: result.data,
        ),
      ); // Update the state with the fetched breeds
    } else {
      emit(
        state.copyWith(
          dogBreedsListStatus: Status.error,
          breedListerror: result.error.toString(),
        ),
      );
    }
  }

  void fetchDogSubBreeds(String breedName) async {
    emit(state.copyWith(dogSubBreedsListStatus: Status.loading));
    final result =
        await dogBreedsRepo.fetchDogSubBreedsList(breedName: breedName);

    if (result.isSuccess) {
      if (result.data.isEmpty) {
        emit(
          state.copyWith(
            dogSubBreedsListStatus: Status.empty,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          dogSubBreedsListStatus: Status.success,
          dogSubBreedsList: result.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          dogSubBreedsListStatus: Status.error,
          subbreedListerror: result.error.toString(),
        ),
      );
    }
  }

  void fetchDogImageDetails(String breedName) async {
    emit(state.copyWith(dogImageStatus: Status.loading));
    final result =
        await dogBreedsRepo.fetchDogImageDetails(breedName: breedName);
    if (result.isSuccess) {
      emit(
        state.copyWith(
          dogImageStatus: Status.success,
          breedImageUrl: result.data.message,
        ),
      );
    } else {
      emit(
        state.copyWith(
          dogImageStatus: Status.error,
          subbreedListerror: result.error.toString(),
        ),
      );
    }
  }
}
