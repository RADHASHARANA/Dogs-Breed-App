import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_state.dart';
import 'package:flutter_networking/repository/dog_breeds_repo.dart';
import '../../../core/network_services/api_result.dart';
import '../../../data/dog_breeds.dart';
import '../../common_widgets/status_handler.dart';

class DogBreedsCubit extends Cubit<DogBreedsState> {
  DogBreedsCubit({required this.dogBreedsRepo})
      : super(DogBreedsListInitial()); // Initial state is an empty list
  final DogBreedsRepo dogBreedsRepo;

  void fetchDogBreeds() async {
    // Fetch dog breeds from your repository
    emit(DogBreedsListState(dogBreedsListStatus: Status.loading));
    final result = await dogBreedsRepo.fetchDogBreedsList();
    if (result.isSuccess) {
      emit(
        DogBreedsListState(
          dogBreedsListStatus: Status.success,
          groupedBreeds: result.data,
        ),
      ); // Update the state with the fetched breeds
    } else {
      emit(
        DogBreedsListState(
          dogBreedsListStatus: Status.error,
          error: result.error.toString(),
        ),
      );
    }
  }

  void fetchDogSubBreeds(String breedName) async {
    emit(DogBreedDetailsState(dogSubBreedsListStatus: Status.loading));
    final subBreedsFuture =
        dogBreedsRepo.fetchDogSubBreedsList(breedName: breedName);
    final imageFuture =
        dogBreedsRepo.fetchDogImageDetails(breedName: breedName);

    // Use Future.wait to execute both API calls concurrently
    final results = await Future.wait([subBreedsFuture, imageFuture]);

    final subBreedsResult = results[0] as ApiResult<List<String>>;
    final imageResult = results[1] as ApiResult<DogImageDetails>;

    if (subBreedsResult.isSuccess && imageResult.isSuccess) {
      if (subBreedsResult.data.isEmpty) {
        emit(
          DogBreedDetailsState(
            dogSubBreedsListStatus: Status.empty,
          ),
        );
        return;
      }
      emit(
        DogBreedDetailsState(
          dogSubBreedsListStatus: Status.success,
          dogSubBreedsList: subBreedsResult.data,
          breedImageUrl: imageResult.data.message,
        ),
      );
    } else if (subBreedsResult.isSuccess) {
      emit(
        DogBreedDetailsState(
          dogSubBreedsListStatus: Status.success,
          dogSubBreedsList: subBreedsResult.data,
          breedImageUrl: '',
        ),
      );
    } else {
      emit(
        DogBreedDetailsState(
          dogSubBreedsListStatus: Status.error,
          error: subBreedsResult.error.toString(),
        ),
      );
    }
  }
}
