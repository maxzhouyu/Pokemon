import 'package:clean_framework/clean_framework.dart';

class PokemonSuccessResponse extends SuccessResponse {
  final Map<String, dynamic> data;

  const PokemonSuccessResponse({required this.data});
}
