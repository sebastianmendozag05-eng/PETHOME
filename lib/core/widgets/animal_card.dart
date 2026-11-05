import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/favorites/favorites_provider.dart';
import '../../models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback onTap;

  const AnimalCard({super.key, required this.animal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final favs = context.watch<FavoritesProvider>();
    final esFav = favs.isFavorite(animal.id);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 130,
              child: Image.asset(
                animal.imagen,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (_, _, _) => Container(
                  color: color.primaryContainer,
                  child: Icon(Icons.pets, size: 45, color: color.primary),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animal.nombre,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 6),
                    Text('${animal.especie} · ${animal.edad}'),
                    Text('Tamaño: ${animal.tamano}'),
                    const SizedBox(height: 8),
                    Chip(label: Text(animal.origen)),
                  ],
                ),
              ),
            ),
            IconButton(
              tooltip: 'Favorito',
              color: color.primary,
              icon: Icon(esFav ? Icons.favorite : Icons.favorite_border),
              onPressed: () => favs.toggle(animal.id),
            ),
          ],
        ),
      ),
    );
  }
}
