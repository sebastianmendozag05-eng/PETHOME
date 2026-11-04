class Animal {
  final String id;
  final String nombre;
  final String especie; // 'perro' | 'gato'
  final String edad; // 'cría' | 'joven' | 'adulto'
  final String tamano; // 'pequeño' | 'mediano' | 'grande'
  final String origen; // 'particular' | 'albergue'
  final String descripcion;
  final String imagen; // ruta en assets/images/
  final String contacto;
  final List<String> requisitos;

  const Animal({
    required this.id,
    required this.nombre,
    required this.especie,
    required this.edad,
    required this.tamano,
    required this.origen,
    required this.descripcion,
    required this.imagen,
    required this.contacto,
    required this.requisitos,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
    id: json['id'] as String,
    nombre: json['nombre'] as String,
    especie: json['especie'] as String,
    edad: json['edad'] as String,
    tamano: json['tamano'] as String,
    origen: json['origen'] as String,
    descripcion: json['descripcion'] as String,
    imagen: json['imagen'] as String,
    contacto: json['contacto'] as String,
    requisitos: List<String>.from(json['requisitos'] as List),
  );
}
