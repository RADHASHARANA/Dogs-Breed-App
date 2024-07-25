import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_networking/feature/common_widgets/status_handler.dart';

import '../bloc/dog_breeds_bloc.dart';
import '../bloc/dog_breeds_state.dart';

class DogBreedDetailsScreen extends StatelessWidget {
  const DogBreedDetailsScreen({super.key, required this.breedName});
  final String breedName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breedName),
      ),
      body: BlocBuilder<DogBreedsCubit, DogBreedsState>(
        builder: (context, state) {
          if (state is DogBreedDetailsState) {
            return StatusHandler(
              status: state.dogSubBreedsListStatus,
              onSuccess: SubBreedListWidget(
                subBreeds: state.dogSubBreedsList,
              ),
              error: state.error,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class SubBreedListWidget extends StatelessWidget {
  const SubBreedListWidget({
    super.key,
    required this.subBreeds,
  });

  final List<String> subBreeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subBreeds.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(subBreeds[index]),
        );
      },
    );
  }
}
