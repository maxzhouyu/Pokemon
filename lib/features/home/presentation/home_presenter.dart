import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/features/home/domain/home_entity.dart';
import 'package:pokemon/features/home/domain/home_ui_output.dart';
import 'package:pokemon/features/home/domain/home_use_case.dart';
import 'package:pokemon/features/home/presentation/home_view_model.dart';
import 'package:pokemon/providers.dart';

class HomePresenter
    extends Presenter<HomeViewModel, HomeUIOutput, HomeUseCase> {
  HomePresenter({
    required super.builder,
    super.key,
  }) : super(provider: homeUseCaseProvider);

  @override
  void onLayoutReady(BuildContext context, HomeUseCase useCase) {
    useCase.fetchPokemons();
  }

  @override
  void onOutputUpdate(BuildContext context, HomeUIOutput output) {
    if (output.isRefresh) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            output.status == HomeStatus.failed
                ? 'Sorry, failed refreshing pokemons!'
                : 'Refreshed pokemons successfully!',
          ),
        ),
      );
    }
  }

  @override
  HomeViewModel createViewModel(
    HomeUseCase useCase,
    HomeUIOutput output,
  ) {
    return HomeViewModel(
      pokemons: output.pokemons
          .map((pokemon) =>
              PokemonViewModel(name: pokemon.name, imageUrl: pokemon.imageUrl))
          .toList(),
      onSearch: (query) => useCase.setInput(PokemonSearchInput(name: query)),
      onRefresh: () => useCase.fetchPokemons(isRefresh: true),
      onRetry: useCase.fetchPokemons,
      isLoading: output.status == HomeStatus.loading,
      hasFailedLoading: output.status == HomeStatus.failed,
    );
  }
}
