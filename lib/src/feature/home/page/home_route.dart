import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class HomeRouterPage extends StatelessWidget implements AutoRouteWrapper {
  const HomeRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
  
  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}