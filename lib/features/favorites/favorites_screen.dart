import 'package:flutter/material.dart';
import 'package:pethome/core/widgets/content_width.dart';
import 'package:provider/provider.dart';
import 'package:pethome/data/animal_repository.dart';
import 'package:pethome/models/animal.dart';

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
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Aún no tienes favoritos.\nGuarda animales desde el catálogo.',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i) {
                final a = lista[i];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      a.imagen,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (_, _, _) => const Icon(Icons.pets),
                    ),
                  ),
                  title: Text(a.nombre),
                  subtitle: Text('${a.especie} · ${a.edad} · ${a.tamano}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () => favoritos.toggle(a.id),
                  ),
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
