import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:my_app/src/commun/enum/routes_enums.dart';
import 'package:my_app/src/model/user_model.dart';
import 'package:my_app/src/page/pages.dart';
import 'package:my_app/src/service/login_service.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    refreshListenable: router,
    initialLocation: Routes.login.path.value,
    redirect: (BuildContext context, GoRouterState state) {
      final inLogin = state.location == Routes.login.path.value;

      if (inLogin && ref.watch(loginProvider) != null) {
        return Routes.home.path.value;
      }

      return null;
    },
    routes: <GoRoute>[
      GoRoute(
        path: Routes.login.path.value,
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginPage(),
          fullscreenDialog: true,
        ),
      ),
      GoRoute(
        path: Routes.home.path.value,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(),
          fullscreenDialog: true,
        ),
      ),
      GoRoute(
        path: Routes.task.path.value,
        pageBuilder: (context, state) => const MaterialPage(
          child: ListTaskPage(),
          fullscreenDialog: true,
        ),
      ),
      GoRoute(
        path: Routes.taskId.path.value,
        pageBuilder: (context, state) => MaterialPage(
          child: TaskPage(id: int.parse(state.pathParameters['id']!)),
          fullscreenDialog: true,
        ),
      ),
    ],
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref ref;

  RouterNotifier(this.ref) {
    ref.listen<UserModel?>(
      loginProvider.select((value) => value),
      (UserModel? previous, UserModel? next) {
        notifyListeners();
      },
    );
  }
}
