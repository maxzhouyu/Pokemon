import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'package:pokemon/features/home/presentation/home_view_model.dart';
import 'package:pokemon/features/home/presentation/home_presenter.dart';

class HomeUI extends UI<HomeViewModel> {
  HomeUI({super.key});

  @override
  HomePresenter create(WidgetBuilder builder) => HomePresenter(builder: builder);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: Text(viewModel.id),
      ),
    );
  }
}