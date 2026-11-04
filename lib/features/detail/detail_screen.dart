
import 'package:flutter/material.dart';
import '../../models/animal.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animal =
        ModalRoute.of(context)!.settings.arguments as Animal;

    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(animal.nombre)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              animal.imagen,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                height: 240,
                color: color.primaryContainer,
                child: Icon(
                  Icons.pets,
                  size: 90,
                  color: color.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            animal.nombre,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          Text('Especie: ${animal.especie}'),
          Text('Edad: ${animal.edad}'),
          Text('Tamaño: ${animal.tamano}'),
          Text('Origen: ${animal.origen}'),
          const SizedBox(height: 20),
          const Text(
            'Sobre esta mascota',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(animal.descripcion),
          const SizedBox(height: 20),
          const Text(
            'Requisitos para adoptar',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...animal.requisitos.map(
            (requisito) => ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(requisito),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Contacto: ${animal.contacto}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
