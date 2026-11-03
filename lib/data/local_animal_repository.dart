import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/animal.dart';
import 'animal_repository.dart';

class LocalAnimalRepository implements AnimalRepository {
  List<Animal>? _animales;

  Future<List<Animal>> _cargar() async {
    if (_animales != null) return _animales!;
    final texto = await rootBundle.loadString('assets/data/animales.json');
    final lista = jsonDecode(texto) as List;
    return _animales = lista
        .map((e) => Animal.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Animal>> obtenerAnimales() async =>
      List.unmodifiable(await _cargar());

  @override
  Future<void> agregarAnimal(Animal animal) async =>
      (await _cargar()).add(animal);
}