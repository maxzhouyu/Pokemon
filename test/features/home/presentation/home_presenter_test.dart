import 'package:pokemon/features/home/domain/home_ui_output.dart';
import 'package:pokemon/features/home/domain/home_use_case.dart';
import 'package:pokemon/features/home/presentation/home_presenter.dart';
import 'package:pokemon/features/home/presentation/home_view_model.dart';
import 'package:pokemon/providers.dart';
import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
      expect: () => const [
        HomeViewModel(id: ''),
        HomeViewModel(id: 'fake-test'),
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
