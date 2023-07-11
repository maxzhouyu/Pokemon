import 'package:clean_framework/clean_framework.dart';

import 'package:pokemon/features/home/domain/home_entity.dart';
import 'package:pokemon/features/home/domain/home_ui_output.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
        : super(
            entity: const HomeEntity(),
            transformers: [HomeUIOutputTransformer()],
          );

  void updateId(String id) {
    entity = entity.copyWith(id: id);
  }
}

class HomeUIOutputTransformer extends OutputTransformer<HomeEntity, HomeUIOutput> {
  @override
  HomeUIOutput transform(HomeEntity entity) {
    return HomeUIOutput(id: entity.id);
  }
}
