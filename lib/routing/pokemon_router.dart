import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:pokemon/features/home/presentation/home_ui.dart';
import 'package:pokemon/routing/routes.dart';

class PokemonRouter extends AppRouter<Routes> {
  @override
  RouterConfiguration configureRouter() {
    return RouterConfiguration(
      routes: [
        AppRoute(
          route: Routes.home,
          builder: (_, __) => HomeUI(),
        ),
      ],
    );
  }
}
