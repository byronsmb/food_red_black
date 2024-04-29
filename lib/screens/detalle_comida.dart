import 'package:flutter/material.dart';
import 'package:food_red_black/models/comida.dart';

class detalleComida extends StatefulWidget {
  const detalleComida({super.key, required this.comida});

  final Comida comida;

  @override
  State<detalleComida> createState() => _detalleComidaState();
}

class _detalleComidaState extends State<detalleComida>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller.forward(); //inicio animacion rotacion
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Hero(
            tag: widget.comida.id,
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 45, 54, 59),
                  boxShadow: [
                    BoxShadow(
                      color: Colors
                          .red, //Color.fromARGB(216, 39, 39, 39), // Color de la sombra
                      spreadRadius: 3, // Radio de expansión de la sombra
                      blurRadius: 7, // Radio de desenfoque de la sombra
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Image.network(widget.comida.imagenUrl)),
          ),
        ), //Image.network(comida.imagenUrl),
      ),
    );
  }
}
