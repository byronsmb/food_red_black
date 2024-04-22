import 'package:flutter/material.dart';
import 'package:food_red_black/data/datos_ficticios.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 63, 71),
      appBar: AppBar(
        actions: const [Icon(Icons.line_axis)],
        backgroundColor: Color.fromARGB(255, 17, 23, 31),
        shadowColor: Colors.red,
        elevation: 8,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 4.0, // espacio entre filas
          crossAxisSpacing: 4.0, // espacio entre columnas
          childAspectRatio: 0.7,
        ),
        padding: EdgeInsets.all(8.0), // padding around the grid
        itemCount: comidaDisponible.length, // total number of items
        itemBuilder: (context, index) {
          return Container(
            color: posicionElmento(index)
                ? const Color.fromARGB(253, 39, 48, 55)
                : const Color.fromARGB(255, 45, 58, 66), // color of grid items
            child: Center(
              child: Image.asset(comidaDisponible[index].imagenUrl),
            ),
          );
        },
      ),
    );
  }
}

bool posicionElmento(int numero) {
  int inicioSerie = 0;
  while (inicioSerie <= numero) {
    if (inicioSerie == numero) {
      return true;
    }
    inicioSerie += 3;
    if (inicioSerie == numero) {
      return true;
    }
    inicioSerie++;
  }
  return false;
}
