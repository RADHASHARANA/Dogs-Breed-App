import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_networking/feature/dog_breeds/widget/dog_breeds_screen.dart';
import 'package:flutter_networking/repository/dog_breeds_repo.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key, required this.dogBreedsRepo});
  final DogBreedsRepo dogBreedsRepo;
  List<RepositoryProvider> get _repositories => [
        RepositoryProvider<DogBreedsRepo>.value(value: dogBreedsRepo),
      ];
  List<BlocProvider> get _bloc => [];
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: _repositories,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DogBreedsScreen(),
      ),
    );
  }
}
