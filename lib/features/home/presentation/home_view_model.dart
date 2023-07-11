import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ViewModel {
  final List<PokemonViewModel> pokemons;
  final bool isLoading;
  final bool hasFailedLoading;

  final VoidCallback onRetry;
  final AsyncCallback onRefresh;
  final ValueChanged<String> onSearch;

  @override
  List<Object?> get props => [pokemons, isLoading, hasFailedLoading];

  const HomeViewModel(
      {required this.pokemons,
      required this.isLoading,
      required this.hasFailedLoading,
      required this.onRetry,
      required this.onRefresh,
      required this.onSearch});
}

class PokemonViewModel extends ViewModel {
  const PokemonViewModel({
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  @override
  List<Object?> get props => [name, imageUrl];
}
