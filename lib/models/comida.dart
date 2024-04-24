import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Comida {
  Comida(
      {required this.id,
      required this.imagenUrl,
      required this.nombre,
      required this.precio,
      required this.descripcion,
      required this.isFavourite,
      required this.calorias,
      required this.peso});

  final int id;
  final String imagenUrl;
  final String nombre;
  final double precio;
  final String descripcion;
  final int calorias;
  final int peso;
  bool isFavourite;
}
