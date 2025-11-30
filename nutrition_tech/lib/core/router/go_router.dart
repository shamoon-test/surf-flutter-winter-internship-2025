import 'package:go_router/go_router.dart';
import 'package:nutrition_tech/core/router/main_menu.dart';
import 'package:nutrition_tech/domain/entities/fruit.dart';
import 'package:nutrition_tech/presentation/pages/create_receipt_page.dart';
import 'package:nutrition_tech/presentation/pages/favorites_page.dart';
import 'package:nutrition_tech/presentation/pages/fruits_page.dart';
import 'package:nutrition_tech/presentation/pages/receipts_page.dart';
import 'package:nutrition_tech/presentation/pages/sort_page.dart';

import '../../presentation/pages/fruit_detail_page.dart';
import 'routes.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainMenu(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.fruits.route,
              name: AppRoute.fruits.name,
              builder: (context, state) => FruitsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.favorites.route,
              name: AppRoute.favorites.name,
              builder: (context, state) => FavoritesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.receipts.route,
              name: AppRoute.receipts.name,
              builder: (context, state) => ReceiptsPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.sort.route,
      name: AppRoute.sort.name,
      builder: (context, state) => SortPage(),
    ),
    GoRoute(
      path: AppRoute.fruitDetails.route,
      name: AppRoute.fruitDetails.name,
      builder: (context, state) => FruitDetailPage(state.extra as Fruit),
    ),
    GoRoute(
      path: AppRoute.createReceipt.route,
      name: AppRoute.createReceipt.name,
      builder: (context, state) => CreateReceiptPage(),
    ),
  ],
  initialLocation: AppRoute.fruits.route,
);
