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
      backgroundColor: Color.fromARGB(255, 49, 66, 74),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 66, 74),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: const Color.fromARGB(255, 45, 54, 59),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        /*IconButton(
            onPressed: () {},
            color: Colors.red,
            sha
            icon: Icon(Icons.arrow_back)),*/ //Icon(Icons.account_circle_rounded),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Hero(
            tag: widget.comida.id,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 45, 54, 59),
                    boxShadow: [
                      BoxShadow(
                        color: Colors
                            .black, //Color.fromARGB(214, 17, 17, 17), // Color de la sombra
                        spreadRadius: 5, // Radio de expansión de la sombra
                        blurRadius: 30, // Radio de desenfoque de la sombra
                        offset: Offset(6, 6),
                      ),
                    ],
                  ),
                  child: Image.network(widget.comida.imagenUrl)),
            ),
          ),
        ), //Image.network(comida.imagenUrl),
      ),
    );
  }
}
