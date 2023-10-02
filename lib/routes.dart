import 'package:clean_architecture_with_mvc/features/auth/presentation/login_page.dart';
import 'package:clean_architecture_with_mvc/features/pokemon/domain/pokemon_details/pokemon_details_entity.dart';

import 'package:clean_architecture_with_mvc/features/pokemon/presentation/pokemon_details/pokemon_details_page.dart';
import 'package:clean_architecture_with_mvc/features/pokemon/presentation/pokemon_list/pokemon_page.dart';
import 'package:clean_architecture_with_mvc/routes_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: '/${AppRouterConstants.login}', routes: [
    GoRoute(
      path: '/login',
      name: AppRouterConstants.login,
      builder: (context, state) => LoginPage(key: state.pageKey),
    ),
    GoRoute(
      path: '/pokemon',
      name: AppRouterConstants.pokemon,
      builder: (context, state) => const PokemonPage(),
    ),
    GoRoute(
      path: '/details',
      name: AppRouterConstants.details,
      builder: (context, state) {
        final pokemonDetails = state.extra! as PokemonDetailsEntity;
        return PokemonDetailsPage(
          pokemonDetails: pokemonDetails,
        );
      },
    ),
  ]);
}

final routerProvider = Provider((ref) => AppRouter());
