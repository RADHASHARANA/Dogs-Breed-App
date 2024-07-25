import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_bloc.dart';
import 'package:flutter_networking/repository/dog_breeds_repo.dart';

import '../bloc/dog_breeds_state.dart';

class DogBreedsScreen extends StatelessWidget {
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
        buildWhen: (previous, current) => current is DobBreedsListState,
        builder: (context, state) {
          if (state is DobBreedsListState) {
            if (state.dogBreedsListStatus == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.dogBreedsListStatus == Status.error) {
              return Center(child: Text(state.error!));
            } else if (state.dogBreedsListStatus == Status.success) {
              final groupedBreeds = <String, List<String>>{};
              for (final breed in state.dogBreedsList) {
                final firstLetter = breed[0].toUpperCase();
                groupedBreeds.putIfAbsent(firstLetter, () => []).add(breed);
              }
              return ListView.builder(
                itemCount: groupedBreeds.keys.length,
                itemBuilder: (context, index) {
                  final letter = groupedBreeds.keys.elementAt(index);
                  final breeds = groupedBreeds[letter]!;
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => DogBreedDetailsScreen(
                              //       breedName: breeds[breedIndex],
                              //     ),
                              //   ),
                              // );
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
