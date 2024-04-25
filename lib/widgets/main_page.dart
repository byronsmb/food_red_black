import 'package:flutter/material.dart';
//import 'package:food_red_black/data/datos_ficticios.dart';
import 'package:food_red_black/models/comida.dart';

import 'package:postgres/postgres.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Connection conn;
  late Result resultados;
  final List comidasDisponibles = [];
  void cargarBD() async {
    try {
      conn = await Connection.open(
        //Si está ejecutando el servidor localmente y usando el emulador de Android,
        //  entonces el endpoint del server debería ser 10.0.2.2:8000 el localhost:8000
        Endpoint(
          host: '10.0.2.2',
          database: 'menu_restaurante',
          username: 'postgres',
          password: 'Byr@23/',
        ),
        settings: const ConnectionSettings(sslMode: SslMode.disable),
      );
    } catch (e) {
      print('Error  al cargar BD: ${e.toString()}');
    }

    //cargar datos de comidas en la  BD
    resultados = await conn.execute(Sql.named('SELECT * FROM comidas'));

    for (var fila in resultados) {
      var comida = Comida(
        id: int.parse(fila[0].toString()),
        nombre: fila[1].toString(),
        descripcion: fila[2].toString(),
        imagenUrl: fila[3].toString(),
        precio: double.parse(fila[4].toString()),
        calorias: int.parse(fila[5].toString()),
        peso: int.parse(fila[6].toString()),
        isFavourite: bool.parse(fila[7].toString()),
      );
      comidasDisponibles.add(comida);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarBD();
  }

  void cargarDatosBD() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 66, 73),
      appBar: AppBar(
        actions: const [Icon(Icons.line_axis)],
        backgroundColor: const Color.fromARGB(255, 17, 23, 31),
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
        itemCount: comidasDisponibles.length, // total number of items
        itemBuilder: (context, index) {
          return Container(
            color: posicionElemento(index)
                ? Color.fromARGB(255, 40, 48, 53)
                : Color.fromARGB(255, 48, 58, 64), // color of grid items
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
                            comidasDisponibles[index].isFavourite =
                                !comidasDisponibles[index].isFavourite;
                          });
                        },
                        icon: Icon(
                            comidasDisponibles[index].isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Color.fromARGB(255, 180, 13, 35)),
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 8,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Image.network(comidasDisponibles[index].imagenUrl),
                  ),
                  Text(
                    comidasDisponibles[index].nombre,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
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

//control de ERRORES
//  Agrupar bien lo quese realiza en el INITSTATE
//FUTURE BUILDER
