import 'package:clean_framework/clean_framework.dart';
import 'package:pokemon/features/home/external_interface/pokemon_external_interface.dart';
import 'package:pokemon/providers/gateway_providers.dart';

final pokemonExternalInterfaceProvider = ExternalInterfaceProvider(
  PokemonExternalInterface.new,
  gateways: [
    pokemonCollectionGateway,
  ],
);
