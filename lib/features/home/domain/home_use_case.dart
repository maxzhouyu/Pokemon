import 'package:clean_framework/clean_framework.dart';
import 'package:pokemon/features/home/domain/home_entity.dart';
import 'package:pokemon/features/home/domain/home_ui_output.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
      : super(
          entity: const HomeEntity(),
          transformers: [
            HomeUIOutputTransformer(),
            PokemonSearchInputTransformer()
          ],
        );

  Future<void> fetchPokemons({bool isRefresh = false}) async {
    if (!isRefresh) {
      entity = entity.copyWith(status: HomeStatus.loading);
    }

    // TODO: Make a request to fetch the pokemons

    if (isRefresh) {
      entity = entity.copyWith(isRefresh: false, status: HomeStatus.loaded);
    }
  }
}

class HomeUIOutputTransformer
    extends OutputTransformer<HomeEntity, HomeUIOutput> {
  @override
  HomeUIOutput transform(HomeEntity entity) {
    final filteredPokemons = entity.pokemons.where(
      (pokemon) {
        final pokeName = pokemon.name.toLowerCase();
        return pokeName.contains(entity.pokemonNameQuery.toLowerCase());
      },
    );

    return HomeUIOutput(
      pokemons: filteredPokemons.toList(growable: false),
      status: entity.status,
      isRefresh: entity.isRefresh,
    );
  }
}

class PokemonSearchInput extends Input {
  PokemonSearchInput({required this.name});

  final String name;
}

class PokemonSearchInputTransformer
    extends InputTransformer<HomeEntity, PokemonSearchInput> {
  @override
  HomeEntity transform(HomeEntity entity, PokemonSearchInput input) {
    return entity.copyWith(pokemonNameQuery: input.name);
  }
}
