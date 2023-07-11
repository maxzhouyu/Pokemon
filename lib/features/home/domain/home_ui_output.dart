import 'package:clean_framework/clean_framework.dart';
import 'package:pokemon/features/home/domain/home_entity.dart';

class HomeUIOutput extends Output {
  const HomeUIOutput({
    required this.pokemons,
    required this.status,
    required this.isRefresh,
  });

  final List<PokemonData> pokemons;
  final HomeStatus status;
  final bool isRefresh;

  @override
  List<Object?> get props => [pokemons, status, isRefresh];
}
