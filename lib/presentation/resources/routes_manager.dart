import 'package:flutter/material.dart';
import 'package:movedb/presentation/main/main_view.dart';
import 'package:movedb/presentation/resources/strings_manager.dart';
import 'package:movedb/presentation/spalsh/splash.dart';

class Routes {
  static const String splashRoute = "/";
  static const String mainRoute = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());

      default:
        return unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
            body: const Center(child: Text(AppStrings.noRouteFound))));
  }
}
