// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:owlmarket_qa_connect/ui/responsive_home_page.dart';

const String ROUTE_NAME_HOME = 'home';

const String ROUTE_PATH_SPLASH = '/';
const String ROUTE_PATH_HOME = '/home';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: ROUTE_PATH_SPLASH,
    builder: (BuildContext context, GoRouterState state) {
      return const ResponsiveHomePage();
    },
  ),
  // GoRoute(
  //   name: ROUTE_NAME_HOME,
  //   path: ROUTE_PATH_HOME,
  //   builder: (BuildContext context, GoRouterState state) {
  //     return const HomePage();
  //   },
  // ),
]);
