import 'package:flutter/material.dart';
import 'package:food_red_black/data/datos_ficticios.dart';
import 'package:postgres/legacy.dart';
import 'package:postgres/postgres.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Connection conn;

  void cargarBD() async {
    conn = await Connection.open(Endpoint(
      host: 'localhost',
      database: 'menu_restaurante',
      username: 'postgres',
      password: 'Byr@23/',
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarBD();
  }

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
        padding: const EdgeInsets.all(8.0), // padding around the grid
        itemCount: comidaDisponible.length, // total number of items
        itemBuilder: (context, index) {
          return Container(
            color: posicionElemento(index)
                ? const Color.fromARGB(253, 39, 48, 55)
                : const Color.fromARGB(255, 45, 58, 66), // color of grid items
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$2.33'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            comidaDisponible[index].isFavourite =
                                !comidaDisponible[index].isFavourite;
                          });
                        },
                        icon: Icon(
                            comidaDisponible[index].isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Color.fromARGB(255, 180, 13, 35)),
                      ),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 8,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Image.asset(comidaDisponible[index].imagenUrl)),
                  Text(
                    'Spaguetti a la carbonara ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color.fromARGB(255, 154, 163, 168)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

bool posicionElemento(int numero) {
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
