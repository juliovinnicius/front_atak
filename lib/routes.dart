import 'package:flutter/material.dart';
import 'package:front_atak/modules/home/presentation/pages/search_page.dart';
import 'package:front_atak/modules/splash/presentation/pages/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const SearchPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rota não definida para ${settings.name}'),
            ),
          ),
        );
    }
  }
}
