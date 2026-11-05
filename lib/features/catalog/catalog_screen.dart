
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/animal.dart';
import '../../data/animal_repository.dart';
import '../../core/widgets/animal_card.dart';
import '../../core/widgets/filter_bar.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late Future<List<Animal>> animales;
  String busqueda = '';
  final Map<String, String> filtros = {};

  @override
  void initState() {
    super.initState();
    animales = context.read<AnimalRepository>().obtenerAnimales();
  }

  List<Animal> filtrar(List<Animal> lista) {
    return lista.where((animal) {
      final coincideNombre = animal.nombre
          .toLowerCase()
          .contains(busqueda.toLowerCase().trim());

      final coincideEspecie =
          (filtros['especie'] ?? 'Todos') == 'Todos' ||
          animal.especie == filtros['especie'];

      final coincideEdad =
          (filtros['edad'] ?? 'Todos') == 'Todos' ||
          animal.edad == filtros['edad'];

      final coincideTamano =
          (filtros['tamano'] ?? 'Todos') == 'Todos' ||
          animal.tamano == filtros['tamano'];

      final coincideOrigen =
          (filtros['origen'] ?? 'Todos') == 'Todos' ||
          animal.origen == filtros['origen'];

      return coincideNombre &&
          coincideEspecie &&
          coincideEdad &&
          coincideTamano &&
          coincideOrigen;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mascotas en adopción'),
      ),
      body: FutureBuilder<List<Animal>>(
        future: animales,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error al cargar mascotas'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final lista = filtrar(snapshot.data!);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: FilterBar(
                  busqueda: busqueda,
                  onBusqueda: (valor) {
                    setState(() => busqueda = valor);
                  },
                  filtros: filtros,
                  onFiltro: (campo, valor) {
                    setState(() => filtros[campo] = valor);
                  },
                ),
              ),
              Expanded(
                child: lista.isEmpty
                    ? const Center(
                        child: Text(
                          'No encontramos mascotas con esos filtros',
                        ),
                      )
                    : ListView.builder(
                        itemCount: lista.length,
                        itemBuilder: (context, index) {
                          final animal = lista[index];

                          return AnimalCard(
                            animal: animal,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: animal,
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
