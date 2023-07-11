import 'package:clean_framework/clean_framework.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/features/home/external_interface/pokemon_request.dart';
import 'package:pokemon/features/home/external_interface/pokemon_success_response.dart';

class PokemonExternalInterface
    extends ExternalInterface<PokemonRequest, PokemonSuccessResponse> {
  final Dio _dio;

  @override
  void handleRequest() {
    on<GetPokemonRequest>((request, send) async {
      final response = await _dio.get<Map<String, dynamic>>(
        request.resource,
        queryParameters: request.queryParams,
      );
      final data = response.data!;
      send(PokemonSuccessResponse(data: data));
    });
  }

  @override
  FailureResponse onError(Object error) {
    throw UnknownFailureResponse(error);
  }

  PokemonExternalInterface({
    Dio? dio,
  }) : _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
}
