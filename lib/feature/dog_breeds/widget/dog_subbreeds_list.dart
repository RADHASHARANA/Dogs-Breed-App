import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_networking/feature/common_widgets/status_handler.dart';

import '../bloc/dog_breeds_bloc.dart';
import '../bloc/dog_breeds_state.dart';
import 'dog_image_screen.dart';

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
          return StatusHandler(
            status: state.dogSubBreedsListStatus,
            onSuccess: SubBreedListWidget(
              subBreeds: state.dogSubBreedsList,
              breed: breedName,
            ),
            error: state.subbreedListerror,
          );
        },
      ),
    );
  }
}

class SubBreedListWidget extends StatelessWidget {
  const SubBreedListWidget({
    super.key,
    required this.subBreeds,
    required this.breed,
  });

  final List<String> subBreeds;
  final String breed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subBreeds.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(subBreeds[index]),
          onTap: () {
            context.read<DogBreedsCubit>().fetchDogImageDetails(breed);
            final Widget child = BlocProvider<DogBreedsCubit>.value(
              value: context.read<DogBreedsCubit>(),
              child: DogImageScreen(breedName: breed),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => child,
              ),
            );
          },
        );
      },
    );
  }
}
