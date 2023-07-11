import 'package:pokemon/features/home/domain/home_entity.dart';
import 'package:pokemon/features/home/domain/home_ui_output.dart';
import 'package:pokemon/features/home/domain/home_use_case.dart';
import 'package:pokemon/providers.dart';
import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeUseCase tests |', () {
    useCaseTest<HomeUseCase, HomeEntity, HomeUIOutput>(
      'example',
      provider: homeUseCaseProvider,
      execute: (useCase) {
        useCase.updateId('test');
      },
      expect: () => [
        const HomeUIOutput(id: 'test'),
      ],
      verify: (useCase) {
        expect(
          useCase.debugEntity,
          const HomeEntity(id: 'test'),
        );
      },
    );
  });
}
