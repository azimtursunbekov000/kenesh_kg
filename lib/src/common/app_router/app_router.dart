import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenesh_kg/src/feature/tab_bar/widgets/page/tab_bar.dart';

import 'app_routes_names.dart';
import 'error_page.dart';

final GoRouter router = GoRouter(
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: ErrorPage());
  },
  initialLocation: "/",
  routes: [
    GoRoute(
      name: AppRoutesNames.mainPage,
      path: "/",
      builder: (context, state) => const TabBarPage(),
    ),
  ],
);
