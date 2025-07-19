import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../main_page.dart';
part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  name: 'Home',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<FamilyRoute>(path: 'family/:familyId')
  ],
)
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  // Widget build(BuildContext context, GoRouterState state) => const MainPage();
  Widget build(BuildContext context, GoRouterState state) => const Text('');
}

class FamilyRoute extends GoRouteData with _$FamilyRoute {
  const FamilyRoute(this.familyId);

  final String familyId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Text('');
  }
}
