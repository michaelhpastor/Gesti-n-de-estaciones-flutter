// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trasmi/layout/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trasmi/estacion.dart';
import 'package:trasmi/layout/visualizar_Esquema.dart';
import 'package:trasmi/layout/widget_estaciones.dart';

class MapaInteractivo extends StatefulWidget {
  const MapaInteractivo({super.key});

  @override
  State<MapaInteractivo> createState() => _MapaInteractivoState();
}

class _MapaInteractivoState extends State<MapaInteractivo> {
  Future<List<Estacion>> fetchEstaciones() async {
    const url = 'http://127.0.0.1:5000/estaciones';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Estacion.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar las estaciones');
    }
  }

  Color cambiocolor(String t) {
    switch (t) {
      case "A":
        return Color.fromARGB(255, 32, 65, 154);

      case "B":
        return Color.fromARGB(255, 122, 193, 67);

      case "C":
        return Color.fromARGB(255, 253, 187, 48);

      case "D":
        return Color.fromARGB(255, 122, 104, 174);

      case "E":
        return Color.fromARGB(255, 171, 101, 13);

      case "F":
        return Color.fromARGB(255, 227, 27, 35);

      case "G":
        return Color.fromARGB(255, 0, 164, 228);

      case "H":
        return Color.fromARGB(255, 246, 137, 31);

      case "J":
        return Color.fromARGB(255, 221, 155, 165);

      case "K":
        return Color.fromARGB(255, 207, 171, 122);

      case "L":
        return Color.fromARGB(255, 0, 170, 166);

      case "M":
        return Color.fromARGB(255, 162, 25, 132);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 227, 27, 35),
        titleSpacing: 0.0,
        title: Row(
          children: [
            Expanded(
              flex: 100, // Este ocupa el 95% del ancho
              child: Container(
                //color: Colors.green,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(
                    'Sistema de gestión de esquemas de estaciones',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: 70,
                //color: Colors.blue,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/imagenes/TransMilenio_Logo.png',
                  height: 58,
                  width: 58,
                )),
          ],
        ),
        shape: Border(
            bottom: BorderSide(color: Colors.black, width: 1.0),
            top: BorderSide(color: Colors.black, width: 1.0)),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        // Contenido del Drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 27, 35),
                ),
                child: Text(
                  'Menú',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              title: Text('Cerrar sesion'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
            ),
            // Agrega más opciones según sea necesario
          ],
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/imagenes/Trasmi.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black
                    .withOpacity(0.5), // Ajusta el nivel de opacidad aquí
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1.0),
                        top: BorderSide(color: Colors.black, width: 1.0),
                        left: BorderSide(color: Colors.black, width: 1.0),
                        right: BorderSide(color: Colors.black, width: 1.0)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage('assets/imagenes/mapaTrasmi.png'))),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width/21,
                top: MediaQuery.of(context).size.height*0.215 ,
                child: EstacionMapa(nombreEstacion: 'Terminal',)
              )
            ]),
          )),
    );
  }
}
