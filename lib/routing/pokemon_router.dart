import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:pokemon/routing/routes.dart';
import 'package:flutter/material.dart';

class PokemonRouter extends AppRouter<Routes> {
  @override
  RouterConfiguration configureRouter() {
    return RouterConfiguration(
      routes: [
        AppRoute(
          route: Routes.home,
          builder: (_, __) => const Placeholder(),
        ),
      ],
    );
  }
}