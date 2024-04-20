import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    const lista = ['1', '2', '1', '2', '1', '2'];
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.line_axis)]),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
        ),
        padding: EdgeInsets.all(8.0), // padding around the grid
        itemCount: lista.length, // total number of items
        itemBuilder: (context, index) {
          return Container(
            color: index % 2 == 0
                ? Color.fromARGB(253, 39, 48, 55)
                : Color(0x2D3A42), // color of grid items
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
