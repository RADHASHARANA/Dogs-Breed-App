import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_networking/feature/common_widgets/status_handler.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_bloc.dart';
import 'package:flutter_networking/repository/dog_breeds_repo.dart';

import '../bloc/dog_breeds_state.dart';
import 'dog_subbreeds_list.dart';

class DogBreedsScreen extends StatelessWidget {
  const DogBreedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DogBreedsCubit(dogBreedsRepo: context.read<DogBreedsRepo>())
            ..fetchDogBreeds(),
      child: DogBreedsView(),
    );
  }
}

class DogBreedsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
      ),
      body: BlocBuilder<DogBreedsCubit, DogBreedsState>(
        builder: (context, state) {
          return StatusHandler(
            status: state.dogBreedsListStatus,
            onSuccess: BreedListWidget(
              groupedBreeds: state.groupedBreeds,
            ),
            error: state.breedListerror,
          );
        },
      ),
    );
  }
}

class BreedListWidget extends StatelessWidget {
  const BreedListWidget({
    super.key,
    required this.groupedBreeds,
  });

  final Map<String, List<String>> groupedBreeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groupedBreeds.keys.length,
      itemBuilder: (context, index) {
        final letter = groupedBreeds.keys.elementAt(index);
        final breeds = groupedBreeds[letter]!;
        return BreedSectionWidget(letter: letter, breeds: breeds);
      },
    );
  }
}

class BreedSectionWidget extends StatelessWidget {
  const BreedSectionWidget({
    super.key,
    required this.letter,
    required this.breeds,
  });

  final String letter;
  final List<String> breeds;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            letter,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: breeds.length,
          itemBuilder: (context, breedIndex) {
            return ListTile(
              title: Text(breeds[breedIndex]),
              onTap: () {
                context
                    .read<DogBreedsCubit>()
                    .fetchDogSubBreeds(breeds[breedIndex]);
                final Widget child = BlocProvider<DogBreedsCubit>.value(
                  value: context.read<DogBreedsCubit>(),
                  child: DogBreedDetailsScreen(breedName: breeds[breedIndex]),
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
        ),
      ],
    );
  }
}
