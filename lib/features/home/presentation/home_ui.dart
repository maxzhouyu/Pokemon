import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/features/home/presentation/home_presenter.dart';
import 'package:pokemon/features/home/presentation/home_view_model.dart';
import 'package:pokemon/features/home/presentation/pokemon_card.dart';
import 'package:pokemon/features/home/presentation/pokemon_search_field.dart';

class HomeUI extends UI<HomeViewModel> {
  HomeUI({super.key});

  @override
  HomePresenter create(WidgetBuilder builder) =>
      HomePresenter(builder: builder);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    Widget child;
    if (viewModel.isLoading) {
      child = const Center(child: CircularProgressIndicator());
    } else if (viewModel.hasFailedLoading) {
      child = _LoadingFailed(onRetry: viewModel.onRetry);
    } else {
      child = RefreshIndicator(
        onRefresh: viewModel.onRefresh,
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
            prototypeItem: const SizedBox(height: 176), // 160 + 16
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final pokemon = viewModel.pokemons[index];

              return PokemonCard(
                key: ValueKey(pokemon.name),
                imageUrl: pokemon.imageUrl,
                name: pokemon.name,
                heroTag: pokemon.name,
                onTap: () {
                  /*TODO: Navigate to detail page*/
                },
              );
            },
            itemCount: viewModel.pokemons.length,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon'),
        centerTitle: false,
        titleTextStyle: textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w300,
        ),
        bottom: viewModel.isLoading || viewModel.hasFailedLoading
            ? null
            : PokemonSearchField(onChanged: viewModel.onSearch),
      ),
      body: child,
    );
  }
}

class _LoadingFailed extends StatelessWidget {
  const _LoadingFailed({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Oops, loading failed.',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: onRetry,
            child: const Text('Help Flareon, find her friends'),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
