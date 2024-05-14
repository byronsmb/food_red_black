import 'package:flutter/material.dart';
import 'package:food_red_black/models/comida.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class detalleComida extends StatefulWidget {
  const detalleComida({super.key, required this.comida});

  final Comida comida;

  @override
  State<detalleComida> createState() => _detalleComidaState();
}

class _detalleComidaState extends State<detalleComida>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int cantidad = 1;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Stack(
            children: [
              Text(
                'Luxe',
                style: GoogleFonts.angkor(fontSize: 65).copyWith(
                    foreground: Paint()
                      ..color = const Color.fromARGB(255, 45, 54, 59)),
              ),
              Text(
                'Luxe',
                style: GoogleFonts.angkor(fontSize: 65).copyWith(
                  foreground: Paint()
                    ..strokeWidth = 2
                    ..color = Colors.black.withOpacity(0.5)
                    ..style = PaintingStyle.stroke,
                ),
              ),
            ],
          )),
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
          SizedBox(height: 30),
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 40, 48, 53),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.fireFlameCurved,
                          size: 30,
                          color: Color.fromARGB(255, 133, 136, 136),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "23",
                          style: GoogleFonts.angkor(
                            fontSize: 28,
                            color: const Color.fromARGB(255, 133, 136, 136),
                          ),
                        ),
                        const SizedBox(width: 40),
                        const Icon(
                          FontAwesomeIcons.weightHanging,
                          size: 30,
                          color: Color.fromARGB(255, 133, 136, 136),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "23",
                          style: GoogleFonts.angkor(
                            fontSize: 28,
                            color: Color.fromARGB(255, 133, 136, 136),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //linea horizontal
                    width:
                        MediaQuery.of(context).size.width, // Ancho de la línea
                    height: 2, // Altura de la línea
                    color:
                        Color.fromARGB(255, 180, 13, 35), // Color de la línea
                  ),
                  SizedBox(height: 6),
                  Text(
                    widget.comida.descripcion,
                    style: GoogleFonts.roboto(fontSize: 16),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${double.parse((widget.comida.precio * cantidad).toStringAsFixed(2))} \$",
                        style: GoogleFonts.bayon(fontSize: 40),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (cantidad > 0) {
                                cantidad--;
                              }
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 48, 58, 64),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 33,
                              color: Color.fromARGB(255, 180, 13, 35),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "$cantidad",
                            style: GoogleFonts.bebasNeue(fontSize: 40),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              cantidad++;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 48, 58, 64),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 33,
                              color: Color.fromARGB(255, 180, 13, 35),
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            final snackBar = SnackBar(
                              content: const Text(
                                'Agregado al carrito',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor:
                                  (Color.fromARGB(69, 244, 67, 54)),
                              action: SnackBarAction(
                                label: 'Ocultar',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 48, 58, 64),
                            ),
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              size: 33,
                              color: Color.fromARGB(255, 180, 13, 35),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
