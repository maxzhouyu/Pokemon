import 'package:clean_framework/clean_framework.dart';
import 'package:pokemon/features/home/external_interface/pokemon_request.dart';
import 'package:pokemon/features/home/external_interface/pokemon_success_response.dart';

class PokemonCollectionGateway extends Gateway<PokemonCollectionGatewayOutput, PokemonCollectionRequest, PokemonSuccessResponse, PokemonCollectionSuccessInput> {
  @override
  PokemonCollectionRequest buildRequest(PokemonCollectionGatewayOutput output) {
    return PokemonCollectionRequest();
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: failureResponse.message);
  }

  @override
  PokemonCollectionSuccessInput onSuccess(PokemonSuccessResponse response) {
    final deserializer = Deserializer(response.data);

    return PokemonCollectionSuccessInput(
      pokemonIdentities: deserializer.getList(
        'results',
        converter: PokemonIdentity.fromJson,
      ),
    );
  }
}

class PokemonCollectionRequest extends GetPokemonRequest {
  @override
  String get resource => 'pokemon';

  @override
  Map<String, dynamic> get queryParams => {'limit': 1000};
}

class PokemonCollectionGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class PokemonCollectionSuccessInput extends SuccessInput {
  PokemonCollectionSuccessInput({required this.pokemonIdentities});

  final List<PokemonIdentity> pokemonIdentities;
}
final _pokemonResUrlRegex = RegExp(r'https://pokeapi.co/api/v2/pokemon/(\d+)/');

class PokemonIdentity {
  PokemonIdentity({required this.name, required this.id});

  final String name;
  final String id;

  factory PokemonIdentity.fromJson(Map<String, dynamic> json) {
    final deserializer = Deserializer(json);

    final match = _pokemonResUrlRegex.firstMatch(deserializer.getString('url'));

    return PokemonIdentity(
      name: deserializer.getString('name'),
      id: match?.group(1) ?? '0',
    );
  }
}