
import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final String busqueda;
  final ValueChanged<String> onBusqueda;
  final Map<String, String> filtros;
  final void Function(String, String) onFiltro;

  const FilterBar({
    super.key,
    required this.busqueda,
    required this.onBusqueda,
    required this.filtros,
    required this.onFiltro,
  });

  @override
  Widget build(BuildContext context) {
    const opciones = {
      'especie': ['Todos', 'perro', 'gato'],
      'edad': ['Todos', 'cría', 'joven', 'adulto'],
      'tamano': ['Todos', 'pequeño', 'mediano', 'grande'],
      'origen': ['Todos', 'particular', 'albergue'],
    };

    const etiquetas = {
      'especie': 'Especie',
      'edad': 'Edad',
      'tamano': 'Tamaño',
      'origen': 'Origen',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: onBusqueda,
          decoration: const InputDecoration(
            labelText: 'Buscar por nombre',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: opciones.entries.map((entrada) {
            return SizedBox(
              width: 150,
              child: DropdownButtonFormField<String>(
                initialValue: filtros[entrada.key] ?? 'Todos',
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: etiquetas[entrada.key],
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
                items: entrada.value.map((opcion) {
                  return DropdownMenuItem(
                    value: opcion,
                    child: Text(opcion),
                  );
                }).toList(),
                onChanged: (valor) {
                  if (valor != null) {
                    onFiltro(entrada.key, valor);
                  }
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
