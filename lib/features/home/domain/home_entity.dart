import 'package:clean_framework/clean_framework.dart';

enum HomeStatus { initial, loading, loaded, failed }
class HomeEntity extends Entity {
  const HomeEntity({
    this.pokemons = const [],
    this.pokemonNameQuery = '',
    this.status = HomeStatus.initial,
    this.isRefresh = false,
  });

  final List<PokemonData> pokemons;
  final String pokemonNameQuery;
  final HomeStatus status;
  final bool isRefresh;


  @override
  List<Object> get props => [pokemons, pokemonNameQuery, status, isRefresh];

  @override
  HomeEntity copyWith({
    List<PokemonData>? pokemons,
    String? pokemonNameQuery,
    HomeStatus? status,
    bool? isRefresh,
  }) {
    return HomeEntity(
      pokemons: pokemons ?? this.pokemons,
      pokemonNameQuery: pokemonNameQuery ?? this.pokemonNameQuery,
      status: status ?? this.status,
      isRefresh: isRefresh ?? this.isRefresh,
    );
  }
}

class PokemonData extends Entity {
  const PokemonData({
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  @override
  List<Object?> get props => [name, imageUrl];
}
