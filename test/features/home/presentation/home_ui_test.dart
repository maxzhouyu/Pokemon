import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/home/presentation/home_ui.dart';
import 'package:pokemon/features/home/presentation/home_view_model.dart';

void main() {
  const spriteBaseUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world';

  group('HomeUI tests |', () {
    uiTest<HomeViewModel>(
      'example',
      ui: HomeUI(),
      viewModel: HomeViewModel(
        pokemons: const [
          PokemonViewModel(name: 'Bulbasaur', imageUrl: '$spriteBaseUrl/1.svg'),
          PokemonViewModel(
              name: 'Charmander', imageUrl: '$spriteBaseUrl/4.svg'),
          PokemonViewModel(name: 'Squirtle', imageUrl: '$spriteBaseUrl/7.svg'),
          PokemonViewModel(name: 'Pikachu', imageUrl: '$spriteBaseUrl/25.svg'),
        ],
        onSearch: (query) {},
        onRefresh: () async {},
        onRetry: () {},
        isLoading: false,
        hasFailedLoading: false,
      ),
      verify: (tester) async {
        expect(find.text('test'), findsOneWidget);
      },
    );
  });
}
