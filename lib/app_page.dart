import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});
  List<RepositoryProvider> get _repositories => [];
  List<BlocProvider> get _bloc => [];
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: _repositories,
      child: MultiBlocProvider(
        providers: _bloc,
        child: MaterialApp.router(),
      ),
    );
  }
}
