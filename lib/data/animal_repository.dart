import 'package:pethome/models/animal.dart';

abstract class AnimalRepository {
  Future<List<Animal>> obtenerAnimales();
  Future<void> agregarAnimal(Animal animal);
}