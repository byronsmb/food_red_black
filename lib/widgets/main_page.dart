import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    const lista = ['1', '2', '1', '2', '1', '2'];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 63, 71),
      appBar: AppBar(actions: [Icon(Icons.line_axis)]),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
        ),
        padding: EdgeInsets.all(8.0), // padding around the grid
        itemCount: lista.length, // total number of items
        itemBuilder: (context, index) {
          return Container(
            color: index % 2 == 0
                ? Color.fromARGB(253, 39, 48, 55)
                : Color.fromARGB(255, 45, 58, 66), // color of grid items
            child: Center(
              child: Text(
                lista[index],
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
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
