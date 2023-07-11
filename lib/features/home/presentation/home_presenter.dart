import 'package:clean_framework/clean_framework.dart';
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
  HomeViewModel createViewModel(
    HomeUseCase useCase,
    HomeUIOutput output,
  ) {
    const spriteBaseUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world';
    return HomeViewModel(
      pokemons: const [
        PokemonViewModel(name: 'Bulbasaur', imageUrl: '$spriteBaseUrl/1.svg'),
        PokemonViewModel(name: 'Charmander', imageUrl: '$spriteBaseUrl/4.svg'),
        PokemonViewModel(name: 'Squirtle', imageUrl: '$spriteBaseUrl/7.svg'),
        PokemonViewModel(name: 'Pikachu', imageUrl: '$spriteBaseUrl/25.svg'),
      ],
      onSearch: (query) {},
      onRefresh: () async {},
      onRetry: () {},
      isLoading: false,
      hasFailedLoading: false,
    );
  }
}
