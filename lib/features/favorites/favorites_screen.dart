import 'package:flutter/material.dart';
import 'package:pethome/core/widgets/content_width.dart';
import 'package:provider/provider.dart';
import 'package:pethome/data/animal_repository.dart';
import 'package:pethome/models/animal.dart';

import 'package:pethome/core/widgets/animal_card.dart';

import 'favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritos = context.watch<FavoritesProvider>();
    final repo = context.read<AnimalRepository>();

    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos')),
      body: ContentWidth(
        child: FutureBuilder<List<Animal>>(
          future: repo.obtenerAnimales(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('No se pudieron cargar los animales'),
              );
            }
            final lista = (snapshot.data ?? [])
                .where((a) => favoritos.isFavorite(a.id))
                .toList();

            if (lista.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 56,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Aún no tienes favoritos.\nGuarda animales desde el catálogo.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: lista.length,
              itemBuilder: (context, i) {
                final a = lista[i];
                return AnimalCard(
                  animal: a,
                  onTap: () =>
                      Navigator.pushNamed(context, '/detail', arguments: a),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
