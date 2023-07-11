import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/providers.dart';
import 'package:pokemon/routing.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviderScope(
      externalInterfaceProviders: [
        pokemonExternalInterfaceProvider,
      ],
      child: AppRouterScope(
        create: PokemonRouter.new,
        builder: (context) {
          return MaterialApp.router(
            title: 'pokemon',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorSchemeSeed: Colors.blue,
              useMaterial3: true,
            ),
            routerConfig: context.router.config,
          );
        },
      ),
    );
  }
}
