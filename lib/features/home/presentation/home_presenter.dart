import 'package:clean_framework/clean_framework.dart';

import 'package:pokemon/features/home/domain/home_ui_output.dart';
import 'package:pokemon/features/home/domain/home_use_case.dart';
import 'package:pokemon/features/home/presentation/home_view_model.dart';
import 'package:pokemon/providers.dart';

class HomePresenter extends Presenter<HomeViewModel, HomeUIOutput, HomeUseCase> {
  HomePresenter({
    required super.builder,
    super.key,
  }) : super(provider: homeUseCaseProvider);

  @override
  HomeViewModel createViewModel(
    HomeUseCase useCase,
    HomeUIOutput output,
  ) {
    return HomeViewModel(id: output.id);
  }
}