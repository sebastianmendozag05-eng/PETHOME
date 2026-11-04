import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'data/animal_repository.dart';
import 'data/local_animal_repository.dart';
import 'features/favorites/favorites_provider.dart';

void main() => runApp(const PethomeApp());

class PethomeApp extends StatelessWidget {
  const PethomeApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      Provider<AnimalRepository>(create: (_) => LocalAnimalRepository()),
      ChangeNotifierProvider(create: (_) => FavoritesProvider()),
    ],
    child: MaterialApp(
      title: 'PETHOME',
      debugShowCheckedModeBanner: false,
      theme: buildPethomeTheme(),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    ),
  );
}
