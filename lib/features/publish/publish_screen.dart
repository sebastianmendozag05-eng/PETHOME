import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pethome/core/widgets/custom_text_field.dart';
import 'package:pethome/data/animal_repository.dart';
import 'package:pethome/models/animal.dart';

class PublishScreen extends StatefulWidget {
  const PublishScreen({super.key});

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _descripcion = TextEditingController();
  final _contacto = TextEditingController();
  final _requisitos = TextEditingController();

  String? _especie, _edad, _tamano, _origen;

  @override
  void dispose() {
    _nombre.dispose();
    _descripcion.dispose();
    _contacto.dispose();
    _requisitos.dispose();
    super.dispose();
  }

  String? _obligatorio(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Campo obligatorio' : null;

  String? _validarContacto(String? v) {
    final texto = v?.trim() ?? '';
    if (texto.isEmpty) return 'Campo obligatorio';
    final esTelefono = RegExp(r'^\d{10}$').hasMatch(texto);
    final esCorreo = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(texto);
    if (!esTelefono && !esCorreo) {
      return 'Escribe un teléfono de 10 dígitos o un correo válido';
    }
    return null;
  }

  Future<void> _enviar() async {
    if (!_formKey.currentState!.validate()) return;

    final requisitos = _requisitos.text
        .split('\n')
        .map((r) => r.trim())
        .where((r) => r.isNotEmpty)
        .toList();

    final animal = Animal(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nombre: _nombre.text.trim(),
      especie: _especie!,
      edad: _edad!,
      tamano: _tamano!,
      origen: _origen!,
      descripcion: _descripcion.text.trim(),
      imagen: 'assets/images/placeholder.png', // pedir a Julián
      contacto: _contacto.text.trim(),
      requisitos: requisitos.isEmpty
          ? ['Compromiso de cuidado responsable']
          : requisitos,
    );

    final repo = context.read<AnimalRepository>();
    await repo.agregarAnimal(animal);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Animal publicado')),
    );
    Navigator.pop(context);
  }

  Widget _desplegable({
    required String label,
    required List<String> opciones,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        initialValue: null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: opciones
            .map((o) => DropdownMenuItem(value: o, child: Text(o)))
            .toList(),
        onChanged: onChanged,
        validator: (v) => v == null ? 'Selecciona una opción' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publicar animal')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CustomTextField(
                label: 'Nombre', controller: _nombre, validator: _obligatorio),
            _desplegable(
                label: 'Especie',
                opciones: const ['perro', 'gato'],
                onChanged: (v) => _especie = v),
            _desplegable(
                label: 'Edad',
                opciones: const ['cría', 'joven', 'adulto'],
                onChanged: (v) => _edad = v),
            _desplegable(
                label: 'Tamaño',
                opciones: const ['pequeño', 'mediano', 'grande'],
                onChanged: (v) => _tamano = v),
            _desplegable(
                label: 'Origen',
                opciones: const ['particular', 'albergue'],
                onChanged: (v) => _origen = v),
            CustomTextField(
                label: 'Descripción',
                controller: _descripcion,
                maxLines: 4,
                validator: _obligatorio),
            CustomTextField(
                label: 'Contacto',
                hint: 'Teléfono (10 dígitos) o correo',
                controller: _contacto,
                keyboardType: TextInputType.emailAddress,
                validator: _validarContacto),
            CustomTextField(
                label: 'Requisitos (uno por línea, opcional)',
                controller: _requisitos,
                maxLines: 3),
            FilledButton(onPressed: _enviar, child: const Text('Publicar')),
          ],
        ),
      ),
    );
  }
}