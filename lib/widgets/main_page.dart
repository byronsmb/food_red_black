import 'package:flutter/material.dart';
//import 'package:food_red_black/data/datos_ficticios.dart';
import 'package:food_red_black/models/comida.dart';
import 'package:food_red_black/screens/detalle_comida.dart';
import 'package:food_red_black/widgets/my_navigation_tab.dart';

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
  double tabWidth = 120;
  double tabHeight = 50;
  int _selectedIndex = 0;

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

  bool _ampliado = false;
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyNavigationTab(
                  title: 'Nuevo',
                  isSelected: _selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                MyNavigationTab(
                  title: 'Temporada',
                  isSelected: _selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                MyNavigationTab(
                  title: 'Popular',
                  isSelected: _selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // numero filas
                mainAxisSpacing: 4.0, // espacio entre filas
                crossAxisSpacing: 4.0, // espacio entre columnas
                childAspectRatio: 0.65,
              ),
              padding: const EdgeInsets.all(8.0), // padding around the grid
              itemCount: comidasDisponibles.length, // total number of items
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleComida(
                            comida: comidasDisponibles[index],
                          ),
                        ));
                  },
                  child: Container(
                    color: posicionElemento(index)
                        ? const Color.fromARGB(255, 40, 48, 53)
                        : const Color.fromARGB(255, 48, 58, 64),
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
                            child: Hero(
                              tag: comidasDisponibles[index].id,
                              child: Image.network(
                                  comidasDisponibles[index].imagenUrl),
                            ),
                          ),
                          Text(
                            comidasDisponibles[index].nombre,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.bayon(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
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
