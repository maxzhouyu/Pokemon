import 'package:clean_framework/clean_framework.dart';
import 'package:pokemon/features/home/external_interface/pokemon_collection_gateway.dart';
import 'package:pokemon/providers.dart';

final pokemonCollectionGateway = GatewayProvider(
  PokemonCollectionGateway.new,
  useCases: [
    homeUseCaseProvider,
  ],
);
