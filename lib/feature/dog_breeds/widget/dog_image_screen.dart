import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_networking/feature/common_widgets/status_handler.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_bloc.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_state.dart';

class DogImageScreen extends StatelessWidget {
  const DogImageScreen({super.key, required this.breedName});
  final String breedName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$breedName Image'),
      ),
      body: BlocBuilder<DogBreedsCubit, DogBreedsState>(
        buildWhen: (previous, current) =>
            previous.breedImageUrl != current.breedImageUrl,
        builder: (context, state) {
          return StatusHandler(
            status: state.dogImageStatus,
            onSuccess: Center(
              child: Image.network(
                state.breedImageUrl,
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            error: state.subbreedListerror,
          );
        },
      ),
    );
  }
}
