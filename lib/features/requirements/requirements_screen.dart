import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class RequirementsScreen extends StatelessWidget {
  const RequirementsScreen({super.key});

  static const List<String> _requisitos = [
    'Ser mayor de edad',
    'Compromiso de esterilización',
    'Contar con un hogar adecuado',
    'Aceptar seguimiento posterior a la adopción',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Requisitos para adoptar')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('Antes de adoptar',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          for (final r in _requisitos)
            Card(
              child: ListTile(
                leading: const Icon(Icons.check_circle,
                    color: AppColors.primario),
                title: Text(r),
              ),
            ),
        ],
      ),
    );
  }
}