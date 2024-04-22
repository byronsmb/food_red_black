import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Comida {
  Comida({
    required this.imagenUrl,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.isFavourite,
  }) : id = uuid.v4();

  final String id;
  final String imagenUrl;
  final String nombre;
  final double precio;
  final String descripcion;
  bool isFavourite;
}
