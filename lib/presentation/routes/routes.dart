import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/detalle_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomePage(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomePage(),
        );
      case '/detalle':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DetallePage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomePage(),
        );
    }
  }
}
