import 'package:pokemon/features/home/presentation/home_ui.dart';
import 'package:pokemon/features/home/presentation/home_view_model.dart';
import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeUI tests |', () {
    uiTest<HomeViewModel>(
      'example',
      ui: HomeUI(),
      viewModel: const HomeViewModel(id: 'test'),
      verify: (tester) async {
        expect(find.text('test'), findsOneWidget);
      },
    );
  });
}
