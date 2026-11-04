import 'package:flutter/material.dart';
import '../../features/splash/splash_screen.dart';
<<<<<<< HEAD
import '../../features/favorites/favorites_screen.dart';
import '../../features/publish/publish_screen.dart';

=======
import '../../features/requirements/requirements_screen.dart';
>>>>>>> origin/main
class AppRoutes {
  static const splash = '/';
  static const catalog = '/catalog';
  static const detail = '/detail';
  static const favorites = '/favorites';
  static const publish = '/publish';
  static const requirements = '/requirements';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
<<<<<<< HEAD
    favorites: (_) => const FavoritesScreen(),
    publish: (_) => const PublishScreen(),
=======
    requirements: (_) => const RequirementsScreen(),
    // Cada integrante agrega aquí UNA línea con su pantalla:
>>>>>>> origin/main
    // catalog: (_) => const CatalogScreen(),
  };
}