import 'package:flutter/material.dart';

import '../../features/splash/splash_screen.dart';
import '../../features/favorites/favorites_screen.dart';
import '../../features/publish/publish_screen.dart';
import '../../features/requirements/requirements_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const catalog = '/catalog';
  static const detail = '/detail';
  static const favorites = '/favorites';
  static const publish = '/publish';
  static const requirements = '/requirements';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    requirements: (_) => const RequirementsScreen(),
    favorites: (_) => const FavoritesScreen(),
    publish: (_) => const PublishScreen(),
    // catalog: (_) => const CatalogScreen(),
  };
}
