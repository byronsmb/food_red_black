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
      backgroundColor: const Color.fromARGB(255, 49, 66, 74),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 66, 74),
        leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 41, 50, 54),
              ),
              child: const Icon(
                Icons.arrow_back_outlined,
                color: Color.fromARGB(255, 180, 13, 35),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 41, 50, 54),
              ),
              child: const Icon(
                Icons.more_vert,
                size: 33,
                color: Color.fromARGB(255, 180, 13, 35),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: ShaderMask(
                  //blendMode: BlendMode.srcATop,
                  shaderCallback: (Rect bounds) {
                    return RadialGradient(
                      center: Alignment.topRight,
                      radius: 2.0,
                      colors: [Colors.orangeAccent, Colors.redAccent],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Hola Mundo',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              RotationTransition(
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
                              color: Colors.black,
                              spreadRadius: 5,
                              blurRadius: 30,
                              offset: Offset(6, 6),
                            ),
                          ],
                        ),
                        child: Image.network(widget.comida.imagenUrl)),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 40, 48, 53),
              )
            ],
          ),
        ],
      ),
    );
  }
}
