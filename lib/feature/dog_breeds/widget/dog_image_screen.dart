import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_networking/feature/common_widgets/status_handler.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_bloc.dart';
import 'package:flutter_networking/feature/dog_breeds/bloc/dog_breeds_state.dart';
import 'package:flutter_networking/utils/strings_utils.dart';

class DogImageScreen extends StatelessWidget {
  const DogImageScreen({super.key, required this.breedName});
  final String breedName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${breedName.capitalizeFirstChar()} Image'),
      ),
      body: BlocBuilder<DogBreedsCubit, DogBreedsState>(
        buildWhen: (previous, current) =>
            previous.breedImageUrl != current.breedImageUrl,
        builder: (context, state) {
          return StatusHandler(
            status: state.dogImageStatus,
            onSuccess: SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.grey.shade900, // Darker gray
                          Colors.grey.shade700, // Lighter gray
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InteractiveViewer(
                      maxScale: 3.0,
                      minScale: 0.5,
                      child: Image.network(
                        state.breedImageUrl,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            error: state.subbreedListerror,
          );
        },
      ),
    );
  }
}
