import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/home/domain/home_ui_output.dart';
import 'package:pokemon/features/home/domain/home_use_case.dart';
import 'package:pokemon/features/home/presentation/home_presenter.dart';
import 'package:pokemon/features/home/presentation/home_view_model.dart';
import 'package:pokemon/providers.dart';

void main() {
  const spriteBaseUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world';

  group('HomePresenter tests |', () {
    presenterTest<HomeViewModel, HomeUIOutput, HomeUseCase>(
      'example',
      create: (builder) => HomePresenter(builder: builder),
      overrides: [
        homeUseCaseProvider.overrideWith(HomeUseCaseFake()),
      ],
      setup: (useCase) {
        useCase.updateId('test');
      },
      expect: () => [
        HomeViewModel(
          pokemons: const [
            PokemonViewModel(
                name: 'Bulbasaur', imageUrl: '$spriteBaseUrl/1.svg'),
            PokemonViewModel(
                name: 'Charmander', imageUrl: '$spriteBaseUrl/4.svg'),
            PokemonViewModel(
                name: 'Squirtle', imageUrl: '$spriteBaseUrl/7.svg'),
            PokemonViewModel(
                name: 'Pikachu', imageUrl: '$spriteBaseUrl/25.svg'),
          ],
          onSearch: (query) {},
          onRefresh: () async {},
          onRetry: () {},
          isLoading: false,
          hasFailedLoading: false,
        ),
        HomeViewModel(
          pokemons: const [
            PokemonViewModel(
                name: 'Bulbasaur', imageUrl: '$spriteBaseUrl/1.svg'),
            PokemonViewModel(
                name: 'Charmander', imageUrl: '$spriteBaseUrl/4.svg'),
            PokemonViewModel(
                name: 'Squirtle', imageUrl: '$spriteBaseUrl/7.svg'),
            PokemonViewModel(
                name: 'Pikachu', imageUrl: '$spriteBaseUrl/25.svg'),
          ],
          onSearch: (query) {},
          onRefresh: () async {},
          onRetry: () {},
          isLoading: false,
          hasFailedLoading: false,
        ),
      ],
    );
  });
}

class HomeUseCaseFake extends HomeUseCase {
  @override
  void updateId(String id) {
    super.updateId('fake-$id');
  }
}
