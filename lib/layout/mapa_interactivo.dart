// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trasmi/layout/Busqueda_Estaciones.dart';
import 'package:trasmi/layout/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trasmi/estacion.dart';
import 'package:trasmi/layout/vista_Editor.dart';
import 'package:trasmi/layout/widget_estaciones.dart';

class MapaInteractivo extends StatefulWidget {
  final num;
  const MapaInteractivo({super.key, required this.num});

  @override
  State<MapaInteractivo> createState() => _MapaInteractivoState();
}

class _MapaInteractivoState extends State<MapaInteractivo> {
  late int numVista;

  @override
  void initState() {
    super.initState();
    numVista = widget.num;
  }

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

  Widget vista1o2(int num) {
    if (num == 1) {
      return ListTile(
        title: Text('Busqueda simple'),
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => BusquedaEstaciones()));
        },
      );
    }else if(num == 2){
      return ListTile(
        title: Text('Busqueda simple'),
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => menuEditor()));
        },
      );
    }else{
      return Container();
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
            vista1o2(numVista),
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
                  left: MediaQuery.of(context).size.width * 0.768,
                  top: MediaQuery.of(context).size.height * 0.022,
                  child: Tooltip(
                    message: "Estaciones 40/144",
                    child: Container(
                      width: 52,
                      height: 53,
                      //color: Colors.amber,
                    ),
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.046,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Terminal', colEst: cambiocolor("B"),
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.073,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 187', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.095,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Portal del Norte', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.111,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Toberin', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.125,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Cardio\nInfantil', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.14,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Mazuren', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.155,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 146', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.169,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 142', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.185,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Alcalá', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.198,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Prado', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.212,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 127', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.227,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Pepe \nSierra', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.242,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 106', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.256,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 100', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.279,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Virrey', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.292,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 85', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.307,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Héroes', colEst: cambiocolor("B")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.34,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 76', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.36,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 72', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.375,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Flores', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.389,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 63', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.404,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 57', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.418,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Marly', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.432,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 45', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.448,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Avenida 39', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.462,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Profamilia', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.477,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 26', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.51,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 22', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.522,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 19', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.543,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Avenida Jimenez A', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.554,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Tercer\nMilenio', colEst: cambiocolor("A")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.585,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Hospital', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.6,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Hortua', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.616,
                  top: MediaQuery.of(context).size.height * 0.215,
                  child: EstacionMapa(
                    nombreEstacion: 'Nariño', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.635,
                  top: MediaQuery.of(context).size.height * 0.222,
                  child: EstacionMapa(
                    nombreEstacion: 'Fucha', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.649,
                  top: MediaQuery.of(context).size.height * 0.249,
                  child: EstacionMapa(
                    nombreEstacion: 'Restrepo', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.66,
                  top: MediaQuery.of(context).size.height * 0.27,
                  child: EstacionMapa(
                    nombreEstacion: 'Olaya', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.673,
                  top: MediaQuery.of(context).size.height * 0.295,
                  child: EstacionMapa(
                    nombreEstacion: 'Quiroga', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.685,
                  top: MediaQuery.of(context).size.height * 0.32,
                  child: EstacionMapa(
                    nombreEstacion: 'Calle 40 S', colEst: cambiocolor("H")
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.698,
                  top: MediaQuery.of(context).size.height * 0.347,
                  child: EstacionMapa(
                    nombreEstacion: 'Santa Lucia', colEst: cambiocolor("H")
                  )),
            ]),
          )),
    );
  }
}
