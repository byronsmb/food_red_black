import 'package:flutter/material.dart';
//import 'package:food_red_black/data/datos_ficticios.dart';
import 'package:food_red_black/models/comida.dart';

import 'package:postgres/postgres.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Connection conn;
  late Result resultados;
  final List comidasDisponibles = [];
  List<double> containerScales = [1.0, 1.0, 1.0];
  int colorSelectindex = 1;

  Future<void> cargarBD() async {
    try {
      conn = await Connection.open(
        Endpoint(
          host: '10.0.2.2',
          database: 'menu_restaurante',
          username: 'postgres',
          password: 'Byr@23/',
        ),
        settings: const ConnectionSettings(sslMode: SslMode.disable),
      );

      // Se conectó exitosamente, ahora se pueden cargar los datos de comidas en la BD
      resultados = await conn.execute(Sql.named('SELECT * FROM comidas'));

      // Inicializar la lista de comidas después de obtener los resultados
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
        //print('cargando ${comidasDisponibles.length}');
      }
    } catch (e) {
      print('Error al cargar BD: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    //addPostFrameCallback se usa para que cargarBD() se ejecute después de que se complete la construcción inicial de los widgets.
    // Después de obtener los datos, setState() se llama para notificar a Flutter que el estado del widget ha cambiado y que debe volver a construir la interfaz de usuario con los nuevos datos.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await cargarBD();
      setState(() {});
    });
  }

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
      body: Column(
        children: [
          /*SingleChildScrollView(
            scrollDirection: Axis.horizontal,*/
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Contenedor 1
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Establece el contenedor 1 a la escala más grande y los otros a su escala original.
                      containerScales = [1.2, 1.0, 1.0];
                      colorSelectindex = 1;
                    });
                  },
                  child: AnimatedContainer(
                    transform: Matrix4.diagonal3Values(
                        containerScales[0], containerScales[0], 1.0),
                    width: 120,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber,
                    ),
                    child: Center(
                        child: Text(
                      'sdcds',
                      style: TextStyle(
                          color: colorSelectindex == 1
                              ? Colors.black
                              : Colors.red),
                    )),
                    duration: Duration(milliseconds: 300),
                  ),
                ),

                // Contenedor 2
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Establece el contenedor 2 a la escala más grande y los otros a su escala original.
                      containerScales = [1.0, 1.2, 1.0];
                      colorSelectindex = 2;
                    });
                  },
                  child: Center(
                    child: AnimatedContainer(
                      transform: Matrix4.diagonal3Values(
                          containerScales[1], containerScales[1], 1.0),
                      width: 120,
                      height: 50,
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber,
                      ),
                      child: Center(child: Text('sdcds')),
                      duration: Duration(milliseconds: 300),
                    ),
                  ),
                ),

                // Contenedor 3
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Establece el contenedor 3 a la escala más grande y los otros a su escala original.
                      containerScales = [1.0, 1.0, 1.2];
                      colorSelectindex = 3;
                    });
                  },
                  child: AnimatedContainer(
                    transform: Matrix4.diagonal3Values(
                        containerScales[2], containerScales[2], 1.0),
                    width: 120,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber,
                    ),
                    child: Center(child: Text('sdcds')),
                    duration: const Duration(milliseconds: 300),
                  ),
                ),
              ],
            ),
          ),
          /* ),*/
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 4.0, // espacio entre filas
                crossAxisSpacing: 4.0, // espacio entre columnas
                childAspectRatio: 0.65,
              ),
              padding: const EdgeInsets.all(8.0), // padding around the grid
              itemCount: comidasDisponibles.length, // total number of items
              itemBuilder: (context, index) {
                return Container(
                  color: posicionElemento(index)
                      ? const Color.fromARGB(255, 40, 48, 53)
                      : const Color.fromARGB(
                          255, 48, 58, 64), // color of grid items
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${comidasDisponibles[index].precio}',
                              style: GoogleFonts.bayon(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 18,
                                //fontWeight: FontWeight.w700,
                              ),
                            ),
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
                                  color:
                                      const Color.fromARGB(255, 180, 13, 35)),
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
                          child: Image.network(
                              comidasDisponibles[index].imagenUrl),
                        ),
                        //SizedBox(height: 10),
                        Text(
                          comidasDisponibles[index].nombre,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.bayon(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 18,
                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
