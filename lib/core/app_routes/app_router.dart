import 'package:restici_admin/core/app_routes/routes_strings.dart';
import 'package:restici_admin/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesStrings.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('Home Screen'),
              ),
            );
          },
        );
      // case RoutesStrings.controlsScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const Text('data');
      //     },
      //   );
    }
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        );
      },
    );
  }
}
